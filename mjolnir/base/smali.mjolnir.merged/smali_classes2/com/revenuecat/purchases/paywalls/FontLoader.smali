.class public final Lcom/revenuecat/purchases/paywalls/FontLoader;
.super Ljava/lang/Object;
.source "FontLoader.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFontLoader.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FontLoader.kt\ncom/revenuecat/purchases/paywalls/FontLoader\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,237:1\n37#2,3:238\n22#2:241\n46#2,4:242\n23#2:246\n37#2,3:247\n37#2,3:250\n37#2,3:253\n26#2:256\n46#2,4:257\n27#2:261\n37#2,3:262\n22#2:265\n46#2,4:266\n23#2:270\n*S KotlinDebug\n*F\n+ 1 FontLoader.kt\ncom/revenuecat/purchases/paywalls/FontLoader\n*L\n50#1:238,3\n122#1:241\n122#1:242,4\n122#1:246\n160#1:247,3\n162#1:250,3\n183#1:253,3\n191#1:256\n191#1:257,4\n191#1:261\n195#1:262,3\n202#1:265\n202#1:266,4\n202#1:270\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000p\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\nJ\u0018\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\r2\u0006\u0010\u001e\u001a\u00020\u0005H\u0002J\u0018\u0010\u001f\u001a\u00020\u001c2\u0006\u0010 \u001a\u00020\r2\u0006\u0010!\u001a\u00020\u0005H\u0002J\u0008\u0010\"\u001a\u00020\u001cH\u0002J\u0010\u0010#\u001a\u0004\u0018\u00010\u000e2\u0006\u0010$\u001a\u00020%J\u0010\u0010&\u001a\u00020\r2\u0006\u0010\'\u001a\u00020(H\u0002J>\u0010)\u001a\u0008\u0012\u0004\u0012\u00020\u00050*2\u0006\u0010 \u001a\u00020\r2\u0006\u0010+\u001a\u00020\r2\u0006\u0010\u001d\u001a\u00020\r2\u0006\u0010,\u001a\u00020\rH\u0002\u00f8\u0001\u0000\u00f8\u0001\u0001\u00f8\u0001\u0002\u00a2\u0006\u0004\u0008-\u0010.J\u0010\u0010/\u001a\u00020\u001c2\u0006\u0010$\u001a\u00020\u0010H\u0002J\u0018\u00100\u001a\u00020\u001c2\u0006\u00101\u001a\u0002022\u0006\u0010\u001e\u001a\u00020\u0005H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e0\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\r0\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R \u0010\u0011\u001a\u0014\u0012\u0004\u0012\u00020\r\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00100\u00120\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001b\u0010\u0015\u001a\u00020\u00168BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0019\u0010\u001a\u001a\u0004\u0008\u0017\u0010\u0018R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u0082\u0002\u000f\n\u0002\u0008!\n\u0005\u0008\u00a1\u001e0\u0001\n\u0002\u0008\u0019\u00a8\u00063"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/FontLoader;",
        "",
        "context",
        "Landroid/content/Context;",
        "cacheDir",
        "Ljava/io/File;",
        "ioScope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "urlConnectionFactory",
        "Lcom/revenuecat/purchases/utils/UrlConnectionFactory;",
        "(Landroid/content/Context;Ljava/io/File;Lkotlinx/coroutines/CoroutineScope;Lcom/revenuecat/purchases/utils/UrlConnectionFactory;)V",
        "cachedFontFamilyByFamilyName",
        "",
        "",
        "Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;",
        "cachedFontFamilyByFontInfo",
        "Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;",
        "fontInfosForHash",
        "",
        "hasCheckedFoldersExist",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "md",
        "Ljava/security/MessageDigest;",
        "getMd",
        "()Ljava/security/MessageDigest;",
        "md$delegate",
        "Lkotlin/Lazy;",
        "addFileToCache",
        "",
        "urlHash",
        "file",
        "downloadToFile",
        "url",
        "outputFile",
        "ensureFoldersExist",
        "getCachedFontFamilyOrStartDownload",
        "fontInfo",
        "Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;",
        "md5Hex",
        "bytes",
        "",
        "performDownloadAndCache",
        "Lkotlin/Result;",
        "expectedMd5",
        "extension",
        "performDownloadAndCache-BWLJW6A",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;",
        "startFontDownload",
        "writeStream",
        "input",
        "Ljava/io/InputStream;",
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
.field private final cacheDir:Ljava/io/File;

.field private final cachedFontFamilyByFamilyName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;",
            ">;"
        }
    .end annotation
.end field

.field private final cachedFontFamilyByFontInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private final fontInfosForHash:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private hasCheckedFoldersExist:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final ioScope:Lkotlinx/coroutines/CoroutineScope;

.field private final md$delegate:Lkotlin/Lazy;

.field private final urlConnectionFactory:Lcom/revenuecat/purchases/utils/UrlConnectionFactory;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/io/File;Lkotlinx/coroutines/CoroutineScope;Lcom/revenuecat/purchases/utils/UrlConnectionFactory;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cacheDir"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "ioScope"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "urlConnectionFactory"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    iput-object p3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->ioScope:Lkotlinx/coroutines/CoroutineScope;

    iput-object p4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->urlConnectionFactory:Lcom/revenuecat/purchases/utils/UrlConnectionFactory;

    .line 34
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->hasCheckedFoldersExist:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 36
    sget-object p1, Lcom/revenuecat/purchases/paywalls/FontLoader$md$2;->INSTANCE:Lcom/revenuecat/purchases/paywalls/FontLoader$md$2;

    check-cast p1, Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->md$delegate:Lkotlin/Lazy;

    .line 40
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->fontInfosForHash:Ljava/util/Map;

    .line 42
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFontInfo:Ljava/util/Map;

    .line 43
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFamilyName:Ljava/util/Map;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/io/File;Lkotlinx/coroutines/CoroutineScope;Lcom/revenuecat/purchases/utils/UrlConnectionFactory;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 30
    new-instance p2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p6

    const-string v0, "rc_paywall_fonts"

    invoke-direct {p2, p6, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :cond_0
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_1

    const/4 p3, 0x1

    const/4 p6, 0x0

    .line 31
    invoke-static {p6, p3, p6}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object p3

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object p6

    check-cast p6, Lkotlin/coroutines/CoroutineContext;

    invoke-interface {p3, p6}, Lkotlinx/coroutines/CompletableJob;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p3

    invoke-static {p3}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object p3

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    .line 32
    new-instance p4, Lcom/revenuecat/purchases/utils/DefaultUrlConnectionFactory;

    invoke-direct {p4}, Lcom/revenuecat/purchases/utils/DefaultUrlConnectionFactory;-><init>()V

    check-cast p4, Lcom/revenuecat/purchases/utils/UrlConnectionFactory;

    .line 28
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/revenuecat/purchases/paywalls/FontLoader;-><init>(Landroid/content/Context;Ljava/io/File;Lkotlinx/coroutines/CoroutineScope;Lcom/revenuecat/purchases/utils/UrlConnectionFactory;)V

    return-void
.end method

.method public static final synthetic access$addFileToCache(Lcom/revenuecat/purchases/paywalls/FontLoader;Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/revenuecat/purchases/paywalls/FontLoader;->addFileToCache(Ljava/lang/String;Ljava/io/File;)V

    return-void
.end method

.method public static final synthetic access$ensureFoldersExist(Lcom/revenuecat/purchases/paywalls/FontLoader;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Lcom/revenuecat/purchases/paywalls/FontLoader;->ensureFoldersExist()V

    return-void
.end method

.method public static final synthetic access$getCacheDir$p(Lcom/revenuecat/purchases/paywalls/FontLoader;)Ljava/io/File;
    .locals 0

    .line 27
    iget-object p0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    return-object p0
.end method

.method public static final synthetic access$getFontInfosForHash$p(Lcom/revenuecat/purchases/paywalls/FontLoader;)Ljava/util/Map;
    .locals 0

    .line 27
    iget-object p0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->fontInfosForHash:Ljava/util/Map;

    return-object p0
.end method

.method public static final synthetic access$md5Hex(Lcom/revenuecat/purchases/paywalls/FontLoader;[B)Ljava/lang/String;
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/paywalls/FontLoader;->md5Hex([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$performDownloadAndCache-BWLJW6A(Lcom/revenuecat/purchases/paywalls/FontLoader;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/revenuecat/purchases/paywalls/FontLoader;->performDownloadAndCache-BWLJW6A(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private final addFileToCache(Ljava/lang/String;Ljava/io/File;)V
    .locals 9

    .line 118
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->fontInfosForHash:Ljava/util/Map;

    .line 119
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-nez v0, :cond_0

    invoke-static {}, Lkotlin/collections/SetsKt;->emptySet()Ljava/util/Set;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

    .line 120
    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;->getFamily()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFontInfo:Ljava/util/Map;

    .line 121
    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 241
    sget-object v1, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v3

    .line 242
    sget-object v4, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v4

    move-object v5, v1

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v4, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_1

    .line 243
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[Purchases] - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 122
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Font already cached for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ". Skipping download."

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 241
    invoke-interface {v3, v1, v2}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFamilyName:Ljava/util/Map;

    .line 125
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;

    if-eqz v3, :cond_3

    .line 127
    new-instance v4, Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;

    .line 128
    invoke-virtual {v3}, Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;->getFamily()Ljava/lang/String;

    move-result-object v5

    .line 129
    invoke-virtual {v3}, Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;->getFonts()Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    new-instance v6, Lcom/revenuecat/purchases/paywalls/DownloadedFont;

    .line 130
    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;->getWeight()I

    move-result v7

    .line 131
    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;->getStyle()Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    move-result-object v8

    .line 129
    invoke-direct {v6, v7, v8, p2}, Lcom/revenuecat/purchases/paywalls/DownloadedFont;-><init>(ILcom/revenuecat/purchases/paywalls/components/properties/FontStyle;Ljava/io/File;)V

    invoke-static {v3, v6}, Lkotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 127
    invoke-direct {v4, v5, v3}, Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;-><init>(Ljava/lang/String;Ljava/util/List;)V

    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFamilyName:Ljava/util/Map;

    .line 135
    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFontInfo:Ljava/util/Map;

    .line 136
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 138
    :cond_3
    new-instance v3, Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;

    .line 141
    new-instance v4, Lcom/revenuecat/purchases/paywalls/DownloadedFont;

    .line 142
    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;->getWeight()I

    move-result v5

    .line 143
    invoke-virtual {v1}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;->getStyle()Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    move-result-object v6

    .line 141
    invoke-direct {v4, v5, v6, p2}, Lcom/revenuecat/purchases/paywalls/DownloadedFont;-><init>(ILcom/revenuecat/purchases/paywalls/components/properties/FontStyle;Ljava/io/File;)V

    .line 140
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 138
    invoke-direct {v3, v2, v4}, Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;-><init>(Ljava/lang/String;Ljava/util/List;)V

    iget-object v4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFontInfo:Ljava/util/Map;

    .line 148
    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFamilyName:Ljava/util/Map;

    .line 149
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_4
    iget-object p2, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->fontInfosForHash:Ljava/util/Map;

    .line 152
    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private final downloadToFile(Ljava/lang/String;Ljava/io/File;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP "

    .line 265
    sget-object v1, Lcom/revenuecat/purchases/LogLevel;->VERBOSE:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 266
    sget-object v3, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v3}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Enum;

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_0

    .line 267
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[Purchases] - "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 202
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Downloading remote font from "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 265
    invoke-interface {v2, v1, v3}, Lcom/revenuecat/purchases/LogHandler;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->urlConnectionFactory:Lcom/revenuecat/purchases/utils/UrlConnectionFactory;

    const/4 v3, 0x2

    .line 205
    invoke-static {v2, p1, v1, v3, v1}, Lcom/revenuecat/purchases/utils/UrlConnectionFactory$-CC;->createConnection$default(Lcom/revenuecat/purchases/utils/UrlConnectionFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/revenuecat/purchases/utils/UrlConnection;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 207
    :try_start_1
    invoke-interface {v2}, Lcom/revenuecat/purchases/utils/UrlConnection;->getResponseCode()I

    move-result v3

    const/16 v4, 0xc8

    if-ne v3, v4, :cond_2

    .line 211
    invoke-interface {v2}, Lcom/revenuecat/purchases/utils/UrlConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    check-cast p1, Ljava/io/Closeable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    move-object v0, p1

    check-cast v0, Ljava/io/InputStream;

    .line 212
    invoke-direct {p0, v0, p2}, Lcom/revenuecat/purchases/paywalls/FontLoader;->writeStream(Ljava/io/InputStream;Ljava/io/File;)V

    .line 213
    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 211
    :try_start_3
    invoke-static {p1, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v2, :cond_1

    .line 215
    invoke-interface {v2}, Lcom/revenuecat/purchases/utils/UrlConnection;->disconnect()V

    :cond_1
    return-void

    :catchall_0
    move-exception p2

    .line 211
    :try_start_4
    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    :try_start_5
    invoke-static {p1, p2}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    .line 208
    :cond_2
    new-instance p2, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v2}, Lcom/revenuecat/purchases/utils/UrlConnection;->getResponseCode()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " when downloading paywall font: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    move-object v1, v2

    goto :goto_0

    :catchall_3
    move-exception p1

    :goto_0
    if-eqz v1, :cond_3

    .line 215
    invoke-interface {v1}, Lcom/revenuecat/purchases/utils/UrlConnection;->disconnect()V

    :cond_3
    throw p1
.end method

.method private final ensureFoldersExist()V
    .locals 5

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->hasCheckedFoldersExist:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    .line 157
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    .line 159
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const-string v1, "[Purchases] - ERROR"

    const/4 v2, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_1

    .line 248
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    .line 160
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unable to create cache directory for remote fonts: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 248
    invoke-interface {v0, v1, v3, v2}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    .line 161
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_2

    .line 251
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    .line 162
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Remote fonts cache path exists but is not a directory: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 251
    invoke-interface {v0, v1, v3, v2}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private final getMd()Ljava/security/MessageDigest;
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->md$delegate:Lkotlin/Lazy;

    .line 36
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "<get-md>(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/security/MessageDigest;

    return-object v0
.end method

.method private final md5Hex([B)Ljava/lang/String;
    .locals 10

    .line 233
    invoke-direct {p0}, Lcom/revenuecat/purchases/paywalls/FontLoader;->getMd()Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    const-string p1, "digest"

    .line 234
    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, ""

    move-object v2, p1

    check-cast v2, Ljava/lang/CharSequence;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    sget-object p1, Lcom/revenuecat/purchases/paywalls/FontLoader$md5Hex$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/FontLoader$md5Hex$1;

    move-object v7, p1

    check-cast v7, Lkotlin/jvm/functions/Function1;

    const/16 v8, 0x1e

    const/4 v9, 0x0

    invoke-static/range {v1 .. v9}, Lkotlin/collections/ArraysKt;->joinToString$default([BLjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private final performDownloadAndCache-BWLJW6A(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "[Purchases] - ERROR"

    const-string v1, "Downloaded font file is corrupt for "

    const-string v2, "Font downloaded successfully from "

    const-string v3, "[Purchases] - "

    .line 174
    new-instance v10, Ljava/io/File;

    iget-object v4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p3, 0x2e

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {v10, v4, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 176
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v4, "."

    invoke-direct {p3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iget-object p4, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cacheDir:Ljava/io/File;

    const-string v4, "rc_paywall_font_download_"

    invoke-static {v4, p3, p4}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p3

    const/4 p4, 0x0

    :try_start_0
    const-string v4, "tempFile"

    .line 178
    invoke-static {p3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1, p3}, Lcom/revenuecat/purchases/paywalls/FontLoader;->downloadToFile(Ljava/lang/String;Ljava/io/File;)V

    .line 180
    invoke-static {p3}, Lkotlin/io/FilesKt;->readBytes(Ljava/io/File;)[B

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/revenuecat/purchases/paywalls/FontLoader;->md5Hex([B)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    .line 181
    invoke-static {v4, p2, v5}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_0

    .line 182
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 254
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v2

    .line 183
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ". expected="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ", actual="

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 254
    invoke-interface {v2, v0, p2, p4}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 184
    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    new-instance p2, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {p2}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 187
    :cond_0
    invoke-virtual {p3, v10}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p2

    if-nez p2, :cond_1

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/4 v9, 0x0

    move-object v4, p3

    move-object v5, v10

    .line 188
    invoke-static/range {v4 .. v9}, Lkotlin/io/FilesKt;->copyTo$default(Ljava/io/File;Ljava/io/File;ZIILjava/lang/Object;)Ljava/io/File;

    .line 189
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 256
    :cond_1
    sget-object p2, Lcom/revenuecat/purchases/LogLevel;->DEBUG:Lcom/revenuecat/purchases/LogLevel;

    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v1

    .line 257
    sget-object v4, Lcom/revenuecat/purchases/common/Config;->INSTANCE:Lcom/revenuecat/purchases/common/Config;

    invoke-virtual {v4}, Lcom/revenuecat/purchases/common/Config;->getLogLevel()Lcom/revenuecat/purchases/LogLevel;

    move-result-object v4

    move-object v5, p2

    check-cast v5, Ljava/lang/Enum;

    invoke-virtual {v4, v5}, Lcom/revenuecat/purchases/LogLevel;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_2

    .line 258
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/revenuecat/purchases/LogLevel;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 191
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 256
    invoke-interface {v1, p2, v2}, Lcom/revenuecat/purchases/LogHandler;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    :cond_2
    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v10}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p2

    .line 194
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 263
    :cond_3
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p3

    .line 195
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error downloading font from "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 263
    invoke-interface {p3, v0, p1, p4}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 196
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {p2}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method private final startFontDownload(Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;)V
    .locals 10

    .line 68
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;->getUrl()Ljava/lang/String;

    move-result-object v2

    .line 69
    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;->getExpectedMd5()Ljava/lang/String;

    move-result-object v3

    iget-object v6, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->ioScope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 71
    new-instance v9, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;

    const/4 v5, 0x0

    move-object v0, v9

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/revenuecat/purchases/paywalls/FontLoader$startFontDownload$1;-><init>(Lcom/revenuecat/purchases/paywalls/FontLoader;Ljava/lang/String;Ljava/lang/String;Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;Lkotlin/coroutines/Continuation;)V

    move-object p1, v9

    check-cast p1, Lkotlin/jvm/functions/Function2;

    const/4 v0, 0x3

    const/4 v9, 0x0

    move-object v4, v6

    move-object v5, v7

    move-object v6, v8

    move-object v7, p1

    move v8, v0

    invoke-static/range {v4 .. v9}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void
.end method

.method private final writeStream(Ljava/io/InputStream;Ljava/io/File;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 221
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    check-cast v0, Ljava/io/Closeable;

    :try_start_0
    move-object p2, v0

    check-cast p2, Ljava/io/FileOutputStream;

    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 225
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-ltz v2, :cond_0

    const/4 v3, 0x0

    .line 227
    invoke-virtual {p2, v1, v3, v2}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 229
    :cond_0
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 221
    invoke-static {v0, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p2

    invoke-static {v0, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2
.end method


# virtual methods
.method public final getCachedFontFamilyOrStartDownload(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;
    .locals 3

    const-string v0, "fontInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    invoke-static {p1}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfoKt;->toDownloadableFontInfo(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Lcom/revenuecat/purchases/utils/Result;

    move-result-object p1

    .line 48
    instance-of v0, p1, Lcom/revenuecat/purchases/utils/Result$Success;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    check-cast p1, Lcom/revenuecat/purchases/utils/Result$Success;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/utils/Result$Success;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

    .line 55
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFontInfo:Ljava/util/Map;

    .line 56
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/revenuecat/purchases/paywalls/FontLoader;->cachedFontFamilyByFamilyName:Ljava/util/Map;

    .line 57
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/revenuecat/purchases/paywalls/DownloadedFontFamily;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 59
    monitor-exit p0

    return-object v0

    .line 61
    :cond_0
    :try_start_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    monitor-exit p0

    .line 63
    invoke-direct {p0, p1}, Lcom/revenuecat/purchases/paywalls/FontLoader;->startFontDownload(Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;)V

    return-object v1

    :catchall_0
    move-exception p1

    .line 55
    monitor-exit p0

    throw p1

    .line 49
    :cond_1
    instance-of v0, p1, Lcom/revenuecat/purchases/utils/Result$Error;

    if-eqz v0, :cond_2

    .line 239
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object v0

    const-string v2, "[Purchases] - ERROR"

    .line 50
    check-cast p1, Lcom/revenuecat/purchases/utils/Result$Error;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/utils/Result$Error;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 239
    invoke-interface {v0, v2, p1, v1}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v1

    .line 51
    :cond_2
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1
.end method
