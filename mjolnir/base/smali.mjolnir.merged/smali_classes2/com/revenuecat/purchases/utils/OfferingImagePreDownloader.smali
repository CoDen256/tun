.class public final Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;
.super Ljava/lang/Object;
.source "OfferingImagePreDownloader.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nOfferingImagePreDownloader.kt\nKotlin\n*S Kotlin\n*F\n+ 1 OfferingImagePreDownloader.kt\ncom/revenuecat/purchases/utils/OfferingImagePreDownloader\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,191:1\n22#2:192\n46#2,4:193\n23#2:197\n26#2:198\n46#2,4:199\n27#2:203\n26#2:209\n46#2,4:210\n27#2:214\n26#2:217\n46#2,4:218\n27#2:222\n1549#3:204\n1620#3,3:205\n1855#3:208\n1856#3:215\n1855#3:216\n1856#3:223\n1446#3,2:224\n1446#3,5:226\n1446#3,5:231\n1446#3,5:236\n1446#3,5:241\n1448#3,3:246\n1549#3:250\n1620#3,3:251\n1360#3:254\n1446#3,5:255\n1#4:249\n*S KotlinDebug\n*F\n+ 1 OfferingImagePreDownloader.kt\ncom/revenuecat/purchases/utils/OfferingImagePreDownloader\n*L\n43#1:192\n43#1:193,4\n43#1:197\n47#1:198\n47#1:199,4\n47#1:203\n59#1:209\n59#1:210,4\n59#1:214\n69#1:217\n69#1:218,4\n69#1:222\n55#1:204\n55#1:205,3\n58#1:208\n58#1:215\n68#1:216\n68#1:223\n90#1:224,2\n93#1:226,5\n101#1:231,5\n106#1:236,5\n111#1:241,5\n90#1:246,3\n171#1:250\n171#1:251,3\n174#1:254\n174#1:255,5\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0002J\u0010\u0010\u000b\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0002J\u0016\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u000f\u001a\u00020\u0010H\u0002J\u000e\u0010\u0011\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nJ&\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u0013*\u00020\u00142\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00030\u0016H\u0002J\u0012\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r*\u00020\u0017H\u0002J\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r*\u0004\u0018\u00010\u0018H\u0002J\u0012\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r*\u00020\u0019H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;",
        "",
        "shouldPredownloadImages",
        "",
        "coilImageDownloader",
        "Lcom/revenuecat/purchases/utils/CoilImageDownloader;",
        "(ZLcom/revenuecat/purchases/utils/CoilImageDownloader;)V",
        "downloadV1Images",
        "",
        "offering",
        "Lcom/revenuecat/purchases/Offering;",
        "downloadV2Images",
        "findImageUrisToDownload",
        "",
        "Landroid/net/Uri;",
        "paywallComponents",
        "Lcom/revenuecat/purchases/Offering$PaywallComponents;",
        "preDownloadOfferingImages",
        "filter",
        "",
        "Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;",
        "predicate",
        "Lkotlin/Function1;",
        "Lcom/revenuecat/purchases/paywalls/components/StackComponent;",
        "Lcom/revenuecat/purchases/paywalls/components/common/Background;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;",
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
.field private final coilImageDownloader:Lcom/revenuecat/purchases/utils/CoilImageDownloader;

.field private final shouldPredownloadImages:Z


# direct methods
.method public constructor <init>(ZLcom/revenuecat/purchases/utils/CoilImageDownloader;)V
    .locals 1

    const-string v0, "coilImageDownloader"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->shouldPredownloadImages:Z

    iput-object p2, p0, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->coilImageDownloader:Lcom/revenuecat/purchases/utils/CoilImageDownloader;

    return-void
.end method

.method public synthetic constructor <init>(ZLcom/revenuecat/purchases/utils/CoilImageDownloader;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    const/4 p4, 0x1

    and-int/2addr p3, p4

    if-eqz p3, :cond_0

    :try_start_0
    const-string p1, "com.revenuecat.purchases.ui.revenuecatui.PaywallKt"

    .line 34
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move p1, p4

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    .line 28
    :cond_0
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;-><init>(ZLcom/revenuecat/purchases/utils/CoilImageDownloader;)V

    return-void
.end method

.method private final downloadV1Images(Lcom/revenuecat/purchases/Offering;)V
    .locals 5

    .line 54
    invoke-virtual {p1}, Lcom/revenuecat/purchases/Offering;->getPaywall()Lcom/revenuecat/purchases/paywalls/PaywallData;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 55
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/PaywallData;->getConfig()Lcom/revenuecat/purchases/paywalls/PaywallData$Configuration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/paywalls/PaywallData$Configuration;->getImages()Lcom/revenuecat/purchases/paywalls/PaywallData$Configuration$Images;

    move-result-object v0

    invoke-virtual {v0}, Lcom/revenuecat/purchases/paywalls/PaywallData$Configuration$Images;->getAll$purchases_defaultsRelease()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 204
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v1, Ljava/util/Collection;

    .line 205
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 206
    check-cast v2, Ljava/lang/String;

    .line 56
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/PaywallData;->getAssetBaseURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 206
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 207
    :cond_0
    check-cast v1, Ljava/util/List;

    .line 58
    check-cast v1, Ljava/lang/Iterable;

    .line 208
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    .line 209
    sget-object v1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 210
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_1

    .line 211
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[Purchases] - "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Pre-downloading Paywall V1 image: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 209
    invoke-interface {v2, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v1, p0, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->coilImageDownloader:Lcom/revenuecat/purchases/utils/CoilImageDownloader;

    const-string v2, "it"

    .line 60
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/revenuecat/purchases/utils/CoilImageDownloader;->downloadImage(Landroid/net/Uri;)V

    goto :goto_1

    :cond_2
    return-void
.end method

.method private final downloadV2Images(Lcom/revenuecat/purchases/Offering;)V
    .locals 5

    .line 66
    invoke-virtual {p1}, Lcom/revenuecat/purchases/Offering;->getPaywallComponents()Lcom/revenuecat/purchases/Offering$PaywallComponents;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 67
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/Offering$PaywallComponents;)Ljava/util/Set;

    move-result-object p1

    .line 68
    check-cast p1, Ljava/lang/Iterable;

    .line 216
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    .line 217
    sget-object v1, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 218
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 219
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[Purchases] - "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 69
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Pre-downloading Paywall V2 image: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 217
    invoke-interface {v2, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v1, p0, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->coilImageDownloader:Lcom/revenuecat/purchases/utils/CoilImageDownloader;

    .line 70
    invoke-virtual {v1, v0}, Lcom/revenuecat/purchases/utils/CoilImageDownloader;->downloadImage(Landroid/net/Uri;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final filter(Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;Lkotlin/jvm/functions/Function1;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;",
            ">;"
        }
    .end annotation

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    .line 148
    new-instance v1, Lkotlin/collections/ArrayDeque;

    invoke-direct {v1}, Lkotlin/collections/ArrayDeque;-><init>()V

    .line 149
    invoke-virtual {v1, p1}, Lkotlin/collections/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 151
    :goto_0
    move-object p1, v1

    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    const/4 v2, 0x1

    xor-int/2addr p1, v2

    if-eqz p1, :cond_12

    .line 152
    invoke-virtual {v1}, Lkotlin/collections/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;

    .line 154
    invoke-interface {p2, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 155
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    :cond_0
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    if-eqz v3, :cond_1

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/StackComponent;->getComponents()Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {v1, p1}, Lkotlin/collections/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 160
    :cond_1
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/PurchaseButtonComponent;

    if-eqz v3, :cond_2

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/PurchaseButtonComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/PurchaseButtonComponent;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object p1

    invoke-virtual {v1, p1}, Lkotlin/collections/ArrayDeque;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 161
    :cond_2
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/ButtonComponent;

    if-eqz v3, :cond_3

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/ButtonComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/ButtonComponent;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object p1

    invoke-virtual {v1, p1}, Lkotlin/collections/ArrayDeque;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 162
    :cond_3
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/PackageComponent;

    if-eqz v3, :cond_4

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/PackageComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/PackageComponent;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object p1

    invoke-virtual {v1, p1}, Lkotlin/collections/ArrayDeque;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 163
    :cond_4
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/StickyFooterComponent;

    if-eqz v3, :cond_5

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/StickyFooterComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/StickyFooterComponent;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object p1

    invoke-virtual {v1, p1}, Lkotlin/collections/ArrayDeque;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 164
    :cond_5
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;

    if-eqz v3, :cond_6

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;->getPages()Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {v1, p1}, Lkotlin/collections/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 165
    :cond_6
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/TabControlButtonComponent;

    if-eqz v3, :cond_7

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/TabControlButtonComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/TabControlButtonComponent;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object p1

    invoke-virtual {v1, p1}, Lkotlin/collections/ArrayDeque;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 166
    :cond_7
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;

    if-eqz v3, :cond_b

    .line 167
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;->getControl()Lcom/revenuecat/purchases/paywalls/components/TabsComponent$TabControl;

    move-result-object v2

    .line 168
    instance-of v3, v2, Lcom/revenuecat/purchases/paywalls/components/TabsComponent$TabControl$Buttons;

    if-eqz v3, :cond_8

    check-cast v2, Lcom/revenuecat/purchases/paywalls/components/TabsComponent$TabControl$Buttons;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/paywalls/components/TabsComponent$TabControl$Buttons;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lkotlin/collections/ArrayDeque;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 169
    :cond_8
    instance-of v3, v2, Lcom/revenuecat/purchases/paywalls/components/TabsComponent$TabControl$Toggle;

    if-eqz v3, :cond_9

    check-cast v2, Lcom/revenuecat/purchases/paywalls/components/TabsComponent$TabControl$Toggle;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/paywalls/components/TabsComponent$TabControl$Toggle;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lkotlin/collections/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 171
    :cond_9
    :goto_1
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;->getTabs()Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 250
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {p1, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 251
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 252
    check-cast v3, Lcom/revenuecat/purchases/paywalls/components/TabsComponent$Tab;

    .line 171
    invoke-virtual {v3}, Lcom/revenuecat/purchases/paywalls/components/TabsComponent$Tab;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object v3

    .line 252
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 253
    :cond_a
    check-cast v2, Ljava/util/List;

    .line 250
    check-cast v2, Ljava/util/Collection;

    .line 171
    invoke-virtual {v1, v2}, Lkotlin/collections/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_0

    .line 173
    :cond_b
    instance-of v3, p1, Lcom/revenuecat/purchases/paywalls/components/TimelineComponent;

    if-eqz v3, :cond_d

    .line 174
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/TimelineComponent;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/TimelineComponent;->getItems()Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 254
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    check-cast v3, Ljava/util/Collection;

    .line 255
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 256
    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/TimelineComponent$Item;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;

    const/4 v6, 0x0

    .line 174
    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/TimelineComponent$Item;->getTitle()Lcom/revenuecat/purchases/paywalls/components/TextComponent;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/TimelineComponent$Item;->getDescription()Lcom/revenuecat/purchases/paywalls/components/TextComponent;

    move-result-object v6

    aput-object v6, v5, v2

    const/4 v6, 0x2

    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/TimelineComponent$Item;->getIcon()Lcom/revenuecat/purchases/paywalls/components/IconComponent;

    move-result-object v4

    aput-object v4, v5, v6

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->listOfNotNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 256
    check-cast v4, Ljava/lang/Iterable;

    .line 257
    invoke-static {v3, v4}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_3

    .line 259
    :cond_c
    check-cast v3, Ljava/util/List;

    .line 254
    check-cast v3, Ljava/util/Collection;

    .line 174
    invoke-virtual {v1, v3}, Lkotlin/collections/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_0

    .line 177
    :cond_d
    instance-of v2, p1, Lcom/revenuecat/purchases/paywalls/components/TabControlToggleComponent;

    if-eqz v2, :cond_e

    goto/16 :goto_0

    .line 178
    :cond_e
    instance-of v2, p1, Lcom/revenuecat/purchases/paywalls/components/TabControlComponent;

    if-eqz v2, :cond_f

    goto/16 :goto_0

    .line 179
    :cond_f
    instance-of v2, p1, Lcom/revenuecat/purchases/paywalls/components/ImageComponent;

    if-eqz v2, :cond_10

    goto/16 :goto_0

    .line 180
    :cond_10
    instance-of v2, p1, Lcom/revenuecat/purchases/paywalls/components/IconComponent;

    if-eqz v2, :cond_11

    goto/16 :goto_0

    .line 181
    :cond_11
    instance-of p1, p1, Lcom/revenuecat/purchases/paywalls/components/TextComponent;

    goto/16 :goto_0

    :cond_12
    return-object v0
.end method

.method private final findImageUrisToDownload(Lcom/revenuecat/purchases/Offering$PaywallComponents;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/Offering$PaywallComponents;",
            ")",
            "Ljava/util/Set<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .line 76
    invoke-virtual {p1}, Lcom/revenuecat/purchases/Offering$PaywallComponents;->getData()Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsData;->getComponentsConfig()Lcom/revenuecat/purchases/paywalls/components/common/ComponentsConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/common/ComponentsConfig;->getBase()Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsConfig;

    move-result-object p1

    .line 78
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsConfig;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/StackComponent;)Ljava/util/Set;

    move-result-object v0

    .line 79
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsConfig;->getStickyFooter()Lcom/revenuecat/purchases/paywalls/components/StickyFooterComponent;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/StickyFooterComponent;->getStack()Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0, v1}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/StackComponent;)Ljava/util/Set;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_1

    invoke-static {}, Lkotlin/collections/SetsKt;->emptySet()Ljava/util/Set;

    move-result-object v1

    :cond_1
    check-cast v1, Ljava/lang/Iterable;

    .line 78
    invoke-static {v0, v1}, Lkotlin/collections/SetsKt;->plus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    .line 80
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/common/PaywallComponentsConfig;->getBackground()Lcom/revenuecat/purchases/paywalls/components/common/Background;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/common/Background;)Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 78
    invoke-static {v0, p1}, Lkotlin/collections/SetsKt;->plus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    return-object p1
.end method

.method private final findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/StackComponent;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/paywalls/components/StackComponent;",
            ")",
            "Ljava/util/Set<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .line 84
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;

    sget-object v0, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;->INSTANCE:Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader$findImageUrisToDownload$1;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-direct {p0, p1, v0}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->filter(Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;Lkotlin/jvm/functions/Function1;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 90
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    check-cast v0, Ljava/util/Collection;

    .line 224
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 225
    check-cast v1, Lcom/revenuecat/purchases/paywalls/components/PaywallComponent;

    .line 92
    instance-of v2, v1, Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    if-eqz v2, :cond_1

    .line 93
    check-cast v1, Lcom/revenuecat/purchases/paywalls/components/StackComponent;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/StackComponent;->getBackground()Lcom/revenuecat/purchases/paywalls/components/common/Background;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/common/Background;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/StackComponent;->getOverrides()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v3, Ljava/util/Set;

    check-cast v3, Ljava/util/Collection;

    .line 226
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 227
    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;

    .line 94
    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->getProperties()Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    move-result-object v4

    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/PartialStackComponent;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/PartialStackComponent;->getBackground()Lcom/revenuecat/purchases/paywalls/components/common/Background;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/common/Background;)Ljava/util/Set;

    move-result-object v4

    .line 227
    check-cast v4, Ljava/lang/Iterable;

    .line 228
    invoke-static {v3, v4}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_1

    .line 230
    :cond_0
    check-cast v3, Ljava/lang/Iterable;

    .line 93
    invoke-static {v2, v3}, Lkotlin/collections/SetsKt;->plus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    goto/16 :goto_6

    .line 97
    :cond_1
    instance-of v2, v1, Lcom/revenuecat/purchases/paywalls/components/IconComponent;

    if-eqz v2, :cond_2

    .line 98
    check-cast v1, Lcom/revenuecat/purchases/paywalls/components/IconComponent;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/IconComponent;->getBaseUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/IconComponent;->getFormats()Lcom/revenuecat/purchases/paywalls/components/IconComponent$Formats;

    move-result-object v1

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/IconComponent$Formats;->getWebp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    goto/16 :goto_6

    .line 100
    :cond_2
    instance-of v2, v1, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;

    if-eqz v2, :cond_4

    .line 101
    check-cast v1, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;->getBackground()Lcom/revenuecat/purchases/paywalls/components/common/Background;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/common/Background;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/CarouselComponent;->getOverrides()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v3, Ljava/util/Set;

    check-cast v3, Ljava/util/Collection;

    .line 231
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 232
    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;

    .line 102
    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->getProperties()Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    move-result-object v4

    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/PartialCarouselComponent;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/PartialCarouselComponent;->getBackground()Lcom/revenuecat/purchases/paywalls/components/common/Background;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/common/Background;)Ljava/util/Set;

    move-result-object v4

    .line 232
    check-cast v4, Ljava/lang/Iterable;

    .line 233
    invoke-static {v3, v4}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_2

    .line 235
    :cond_3
    check-cast v3, Ljava/lang/Iterable;

    .line 101
    invoke-static {v2, v3}, Lkotlin/collections/SetsKt;->plus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    goto/16 :goto_6

    .line 105
    :cond_4
    instance-of v2, v1, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;

    if-eqz v2, :cond_6

    .line 106
    check-cast v1, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;->getBackground()Lcom/revenuecat/purchases/paywalls/components/common/Background;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/common/Background;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/TabsComponent;->getOverrides()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v3, Ljava/util/Set;

    check-cast v3, Ljava/util/Collection;

    .line 236
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 237
    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;

    .line 107
    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->getProperties()Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    move-result-object v4

    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/PartialTabsComponent;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/PartialTabsComponent;->getBackground()Lcom/revenuecat/purchases/paywalls/components/common/Background;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/common/Background;)Ljava/util/Set;

    move-result-object v4

    .line 237
    check-cast v4, Ljava/lang/Iterable;

    .line 238
    invoke-static {v3, v4}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_3

    .line 240
    :cond_5
    check-cast v3, Ljava/lang/Iterable;

    .line 106
    invoke-static {v2, v3}, Lkotlin/collections/SetsKt;->plus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    goto :goto_6

    .line 110
    :cond_6
    instance-of v2, v1, Lcom/revenuecat/purchases/paywalls/components/ImageComponent;

    if-eqz v2, :cond_a

    .line 111
    check-cast v1, Lcom/revenuecat/purchases/paywalls/components/ImageComponent;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/ImageComponent;->getSource()Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/ImageComponent;->getOverrides()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v3, Ljava/util/Set;

    check-cast v3, Ljava/util/Collection;

    .line 241
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 242
    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;

    .line 112
    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/common/ComponentOverride;->getProperties()Lcom/revenuecat/purchases/paywalls/components/PartialComponent;

    move-result-object v4

    check-cast v4, Lcom/revenuecat/purchases/paywalls/components/PartialImageComponent;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/paywalls/components/PartialImageComponent;->getSource()Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    move-result-object v4

    if-eqz v4, :cond_7

    invoke-direct {p0, v4}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Ljava/util/Set;

    move-result-object v4

    goto :goto_5

    :cond_7
    const/4 v4, 0x0

    :goto_5
    if-nez v4, :cond_8

    invoke-static {}, Lkotlin/collections/SetsKt;->emptySet()Ljava/util/Set;

    move-result-object v4

    .line 242
    :cond_8
    check-cast v4, Ljava/lang/Iterable;

    .line 243
    invoke-static {v3, v4}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_4

    .line 245
    :cond_9
    check-cast v3, Ljava/lang/Iterable;

    .line 111
    invoke-static {v2, v3}, Lkotlin/collections/SetsKt;->plus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    goto :goto_6

    .line 115
    :cond_a
    invoke-static {}, Lkotlin/collections/SetsKt;->emptySet()Ljava/util/Set;

    move-result-object v1

    .line 225
    :goto_6
    check-cast v1, Ljava/lang/Iterable;

    .line 246
    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto/16 :goto_0

    .line 248
    :cond_b
    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method private final findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/common/Background;)Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/paywalls/components/common/Background;",
            ")",
            "Ljava/util/Set<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .line 122
    instance-of v0, p1, Lcom/revenuecat/purchases/paywalls/components/common/Background$Image;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/net/Uri;

    .line 123
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/common/Background$Image;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/common/Background$Image;->getValue()Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    move-result-object v1

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;->getLight()Lcom/revenuecat/purchases/paywalls/components/properties/ImageUrls;

    move-result-object v1

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/properties/ImageUrls;->getWebpLowRes()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 124
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/common/Background$Image;->getValue()Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    move-result-object p1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;->getDark()Lcom/revenuecat/purchases/paywalls/components/properties/ImageUrls;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/properties/ImageUrls;->getWebpLowRes()Ljava/net/URL;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 122
    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOfNotNull([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    goto :goto_2

    .line 126
    :cond_1
    instance-of v0, p1, Lcom/revenuecat/purchases/paywalls/components/common/Background$Color;

    if-eqz v0, :cond_2

    goto :goto_1

    .line 127
    :cond_2
    instance-of v0, p1, Lcom/revenuecat/purchases/paywalls/components/common/Background$Unknown;

    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    if-nez p1, :cond_4

    .line 129
    :goto_1
    invoke-static {}, Lkotlin/collections/SetsKt;->emptySet()Ljava/util/Set;

    move-result-object p1

    :goto_2
    return-object p1

    :cond_4
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1
.end method

.method private final findImageUrisToDownload(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;",
            ")",
            "Ljava/util/Set<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/net/Uri;

    .line 135
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;->getLight()Lcom/revenuecat/purchases/paywalls/components/properties/ImageUrls;

    move-result-object v1

    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/components/properties/ImageUrls;->getWebpLowRes()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 136
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;->getDark()Lcom/revenuecat/purchases/paywalls/components/properties/ImageUrls;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/properties/ImageUrls;->getWebpLowRes()Ljava/net/URL;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 134
    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOfNotNull([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public final preDownloadOfferingImages(Lcom/revenuecat/purchases/Offering;)V
    .locals 5

    const-string v0, "offering"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->shouldPredownloadImages:Z

    const-string v1, "[Purchases] - "

    if-nez v0, :cond_1

    .line 192
    sget-object p1, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    .line 193
    sget-object v2, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v2

    move-object v3, p1

    check-cast v3, Ljava/lang/Enum;

    invoke-virtual {v2, v3}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    if-gtz v2, :cond_0

    .line 194
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "OfferingImagePreDownloader won\'t pre-download images"

    .line 192
    invoke-interface {v0, p1, v1}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void

    .line 198
    :cond_1
    sget-object v0, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 199
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, v0

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_2

    .line 200
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OfferingImagePreDownloader: starting image download"

    .line 198
    invoke-interface {v2, v0, v1}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    :cond_2
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->downloadV1Images(Lcom/revenuecat/purchases/Offering;)V

    .line 50
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/utils/OfferingImagePreDownloader;->downloadV2Images(Lcom/revenuecat/purchases/Offering;)V

    return-void
.end method
