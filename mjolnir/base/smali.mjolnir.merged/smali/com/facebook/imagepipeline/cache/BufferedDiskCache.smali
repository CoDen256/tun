.class public final Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
.super Ljava/lang/Object;
.source "BufferedDiskCache.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/cache/BufferedDiskCache$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBufferedDiskCache.kt\nKotlin\n*S Kotlin\n*F\n+ 1 BufferedDiskCache.kt\ncom/facebook/imagepipeline/cache/BufferedDiskCache\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,407:1\n1#2:408\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000p\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000 /2\u00020\u0001:\u0001/B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0002\u0010\rJ\u000e\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017J\u0010\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u0017H\u0002J\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bJ\u0014\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u001b2\u0006\u0010\u0016\u001a\u00020\u0017J\u0016\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u001b2\u0006\u0010\u0016\u001a\u00020\u0017H\u0002J\u000e\u0010\u001f\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u0017J\u000e\u0010 \u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u0017J\u001e\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\"0\u001b2\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010#\u001a\u00020\"H\u0002J\u001f\u0010$\u001a\u0008\u0012\u0004\u0012\u00020\"0\u001b2\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010%\u001a\u00020&H\u0086\u0002J\u001e\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\"0\u001b2\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010%\u001a\u00020&H\u0002J\u0014\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u0006\u0010\u0016\u001a\u00020\u0017J\u0016\u0010)\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010*\u001a\u00020\"J\u0012\u0010+\u001a\u0004\u0018\u00010,2\u0006\u0010\u0016\u001a\u00020\u0017H\u0002J\u0014\u0010-\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u0006\u0010\u0016\u001a\u00020\u0017J\u001a\u0010.\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0008\u0010*\u001a\u0004\u0018\u00010\"H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u000e\u001a\u00020\u000f8F\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00060"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
        "",
        "fileCache",
        "Lcom/facebook/cache/disk/FileCache;",
        "pooledByteBufferFactory",
        "Lcom/facebook/common/memory/PooledByteBufferFactory;",
        "pooledByteStreams",
        "Lcom/facebook/common/memory/PooledByteStreams;",
        "readExecutor",
        "Ljava/util/concurrent/Executor;",
        "writeExecutor",
        "imageCacheStatsTracker",
        "Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;",
        "(Lcom/facebook/cache/disk/FileCache;Lcom/facebook/common/memory/PooledByteBufferFactory;Lcom/facebook/common/memory/PooledByteStreams;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;)V",
        "size",
        "",
        "getSize",
        "()J",
        "stagingArea",
        "Lcom/facebook/imagepipeline/cache/StagingArea;",
        "addKeyForAsyncProbing",
        "",
        "key",
        "Lcom/facebook/cache/common/CacheKey;",
        "checkInStagingAreaAndFileCache",
        "",
        "clearAll",
        "Lbolts/Task;",
        "Ljava/lang/Void;",
        "contains",
        "containsAsync",
        "containsSync",
        "diskCheckSync",
        "foundPinnedImage",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "pinnedImage",
        "get",
        "isCancelled",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "getAsync",
        "probe",
        "put",
        "encodedImage",
        "readFromDiskCache",
        "Lcom/facebook/common/memory/PooledByteBuffer;",
        "remove",
        "writeToDiskCache",
        "Companion",
        "imagepipeline_release"
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
.field public static final Companion:Lcom/facebook/imagepipeline/cache/BufferedDiskCache$Companion;

.field private static final TAG:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field private final fileCache:Lcom/facebook/cache/disk/FileCache;

.field private final imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

.field private final pooledByteBufferFactory:Lcom/facebook/common/memory/PooledByteBufferFactory;

.field private final pooledByteStreams:Lcom/facebook/common/memory/PooledByteStreams;

.field private final readExecutor:Ljava/util/concurrent/Executor;

.field private final stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

.field private final writeExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public static synthetic $r8$lambda$7a4UcT5y9znWcc-20xlSEpjSWIQ(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/imagepipeline/image/EncodedImage;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->getAsync$lambda$3(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ESP31JjW46va1QWRuuYZ1GfI_zg(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Void;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->probe$lambda$2(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$cPgUcxZ4BGPwkGlccq5T7heLKW0(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Void;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->remove$lambda$5(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$l_L1oH3Pu_yW9Uve6i0CsfHAkaM(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Ljava/io/OutputStream;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->writeToDiskCache$lambda$7(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Ljava/io/OutputStream;)V

    return-void
.end method

.method public static synthetic $r8$lambda$r6eQjbG950lBugMFeygAslnl8wk(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;)Ljava/lang/Void;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->clearAll$lambda$6(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$rtD4TzHWEdzW8GUPuOp24H0IpKY(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->put$lambda$4(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    return-void
.end method

.method public static synthetic $r8$lambda$tbWTWMUxL0E3AUFiD_UpVVYAoO0(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Boolean;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->containsAsync$lambda$0(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->Companion:Lcom/facebook/imagepipeline/cache/BufferedDiskCache$Companion;

    const-class v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    sput-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/cache/disk/FileCache;Lcom/facebook/common/memory/PooledByteBufferFactory;Lcom/facebook/common/memory/PooledByteStreams;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;)V
    .locals 1

    const-string v0, "fileCache"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pooledByteBufferFactory"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pooledByteStreams"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "readExecutor"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "writeExecutor"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "imageCacheStatsTracker"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    iput-object p2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->pooledByteBufferFactory:Lcom/facebook/common/memory/PooledByteBufferFactory;

    iput-object p3, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->pooledByteStreams:Lcom/facebook/common/memory/PooledByteStreams;

    iput-object p4, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->readExecutor:Ljava/util/concurrent/Executor;

    iput-object p5, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->writeExecutor:Ljava/util/concurrent/Executor;

    iput-object p6, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    .line 40
    invoke-static {}, Lcom/facebook/imagepipeline/cache/StagingArea;->getInstance()Lcom/facebook/imagepipeline/cache/StagingArea;

    move-result-object p1

    const-string p2, "getInstance()"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    return-void
.end method

.method private final checkInStagingAreaAndFileCache(Lcom/facebook/cache/common/CacheKey;)Z
    .locals 3

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    .line 166
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/StagingArea;->get(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->close()V

    sget-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    const-string v1, "Found image for %s in staging area"

    .line 169
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    .line 170
    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onStagingAreaHit(Lcom/facebook/cache/common/CacheKey;)V

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    const-string v1, "Did not find image for %s in staging area"

    .line 173
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    .line 174
    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onStagingAreaMiss(Lcom/facebook/cache/common/CacheKey;)V

    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    .line 176
    invoke-interface {v0, p1}, Lcom/facebook/cache/disk/FileCache;->hasKey(Lcom/facebook/cache/common/CacheKey;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private static final clearAll$lambda$6(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;)Ljava/lang/Void;
    .locals 3

    const-string/jumbo v0, "this$0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 318
    invoke-static {p0, v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeginWork(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 320
    :try_start_0
    iget-object v2, p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    invoke-virtual {v2}, Lcom/facebook/imagepipeline/cache/StagingArea;->clearAll()V

    .line 321
    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    invoke-interface {p1}, Lcom/facebook/cache/disk/FileCache;->clearAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 327
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    return-object v0

    :catchall_0
    move-exception p1

    .line 324
    :try_start_1
    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->markFailure(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 325
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p0

    .line 327
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    throw p0
.end method

.method private final containsAsync(Lcom/facebook/cache/common/CacheKey;)Lbolts/Task;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/cache/common/CacheKey;",
            ")",
            "Lbolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    :try_start_0
    const-string v0, "BufferedDiskCache_containsAsync"

    .line 70
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeforeSubmitWork(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 71
    new-instance v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda5;

    invoke-direct {v1, v0, p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda5;-><init>(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->readExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v1, v0}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lbolts/Task;

    move-result-object v0

    const-string/jumbo v1, "{\n      val token = Fres\u2026      readExecutor)\n    }"

    .line 69
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    .line 87
    move-object v2, v0

    check-cast v2, Ljava/lang/Throwable;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v4

    const-string p1, "Failed to schedule disk-cache read for %s"

    invoke-static {v1, v2, p1, v3}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 88
    invoke-static {v0}, Lbolts/Task;->forError(Ljava/lang/Exception;)Lbolts/Task;

    move-result-object v0

    const-string/jumbo p1, "{\n      // Log failure\n \u2026forError(exception)\n    }"

    .line 84
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    return-object v0
.end method

.method private static final containsAsync$lambda$0(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Boolean;
    .locals 1

    const-string/jumbo v0, "this$0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$key"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 73
    invoke-static {p0, v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeginWork(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 75
    :try_start_0
    invoke-direct {p1, p2}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->checkInStagingAreaAndFileCache(Lcom/facebook/cache/common/CacheKey;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    return-object p0

    :catchall_0
    move-exception p1

    .line 77
    :try_start_1
    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->markFailure(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 78
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p0

    .line 80
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    throw p0
.end method

.method private final foundPinnedImage(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)Lbolts/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ")",
            "Lbolts/Task<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    const-string v1, "Found image for %s in staging area"

    .line 343
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    .line 344
    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onStagingAreaHit(Lcom/facebook/cache/common/CacheKey;)V

    .line 345
    invoke-static {p2}, Lbolts/Task;->forResult(Ljava/lang/Object;)Lbolts/Task;

    move-result-object p1

    const-string p2, "forResult(pinnedImage)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method private final getAsync(Lcom/facebook/cache/common/CacheKey;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/cache/common/CacheKey;",
            "Ljava/util/concurrent/atomic/AtomicBoolean;",
            ")",
            "Lbolts/Task<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    :try_start_0
    const-string v0, "BufferedDiskCache_getAsync"

    .line 185
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeforeSubmitWork(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 186
    new-instance v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0, p2, p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)V

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->readExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v1, p2}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lbolts/Task;

    move-result-object p2

    const-string/jumbo v0, "{\n      val token = Fres\u2026      readExecutor)\n    }"

    .line 184
    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    sget-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    .line 231
    move-object v1, p2

    check-cast v1, Ljava/lang/Throwable;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v3

    const-string p1, "Failed to schedule disk-cache read for %s"

    invoke-static {v0, v1, p1, v2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 232
    invoke-static {p2}, Lbolts/Task;->forError(Ljava/lang/Exception;)Lbolts/Task;

    move-result-object p2

    const-string/jumbo p1, "{\n      // Log failure\n \u2026forError(exception)\n    }"

    .line 228
    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    return-object p2
.end method

.method private static final getAsync$lambda$3(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/imagepipeline/image/EncodedImage;
    .locals 4

    const-string v0, "$isCancelled"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "this$0"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$key"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 188
    invoke-static {p0, v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeginWork(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 190
    :try_start_0
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_3

    .line 193
    iget-object p1, p2, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    invoke-virtual {p1, p3}, Lcom/facebook/imagepipeline/cache/StagingArea;->get(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object p1

    if-eqz p1, :cond_0

    sget-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    const-string v2, "Found image for %s in staging area"

    .line 195
    invoke-interface {p3}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 196
    iget-object p2, p2, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    invoke-interface {p2, p3}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onStagingAreaHit(Lcom/facebook/cache/common/CacheKey;)V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    const-string v2, "Did not find image for %s in staging area"

    .line 198
    invoke-interface {p3}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 199
    iget-object p1, p2, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    invoke-interface {p1, p3}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onStagingAreaMiss(Lcom/facebook/cache/common/CacheKey;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 202
    :try_start_1
    invoke-direct {p2, p3}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->readFromDiskCache(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/common/memory/PooledByteBuffer;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez p1, :cond_1

    .line 224
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    return-object v0

    .line 203
    :cond_1
    :try_start_2
    check-cast p1, Ljava/io/Closeable;

    invoke-static {p1}, Lcom/facebook/common/references/CloseableReference;->of(Ljava/io/Closeable;)Lcom/facebook/common/references/CloseableReference;

    move-result-object p1

    const-string p2, "of(buffer)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 205
    :try_start_3
    new-instance p2, Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-direct {p2, p1}, Lcom/facebook/imagepipeline/image/EncodedImage;-><init>(Lcom/facebook/common/references/CloseableReference;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 207
    :try_start_4
    invoke-static {p1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-object p1, p2

    .line 213
    :goto_0
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-nez p2, :cond_2

    .line 224
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    return-object p1

    :cond_2
    :try_start_6
    sget-object p2, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    const-string p3, "Host thread was interrupted, decreasing reference count"

    .line 214
    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;)V

    .line 215
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->close()V

    .line 216
    new-instance p1, Ljava/lang/InterruptedException;

    invoke-direct {p1}, Ljava/lang/InterruptedException;-><init>()V

    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_0
    move-exception p2

    .line 207
    :try_start_7
    invoke-static {p1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw p2
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 224
    :catch_0
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    return-object v0

    .line 191
    :cond_3
    :try_start_8
    new-instance p1, Ljava/util/concurrent/CancellationException;

    invoke-direct {p1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p1

    .line 221
    :try_start_9
    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->markFailure(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 222
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :catchall_2
    move-exception p0

    .line 224
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    throw p0
.end method

.method private static final probe$lambda$2(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Void;
    .locals 1

    const-string/jumbo v0, "this$0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$key"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 139
    invoke-static {p0, v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeginWork(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 141
    :try_start_0
    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    invoke-interface {p1, p2}, Lcom/facebook/cache/disk/FileCache;->probe(Lcom/facebook/cache/common/CacheKey;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    invoke-static {p0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    return-object v0

    :catchall_0
    move-exception p1

    invoke-static {p0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    throw p1
.end method

.method private static final put$lambda$4(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 2

    const-string/jumbo v0, "this$0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$key"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 257
    invoke-static {p0, v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeginWork(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 259
    :try_start_0
    invoke-direct {p1, p2, p3}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->writeToDiskCache(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    iget-object p0, p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    invoke-static {p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0, p2, p3}, Lcom/facebook/imagepipeline/cache/StagingArea;->remove(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)Z

    .line 265
    invoke-static {p3}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 266
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v1

    .line 261
    :try_start_1
    invoke-static {p0, v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->markFailure(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 262
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p0

    .line 264
    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    invoke-static {p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1, p2, p3}, Lcom/facebook/imagepipeline/cache/StagingArea;->remove(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)Z

    .line 265
    invoke-static {p3}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 266
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    throw p0
.end method

.method private final readFromDiskCache(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/common/memory/PooledByteBuffer;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    sget-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    const-string v1, "Disk cache read for %s"

    .line 352
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    .line 353
    invoke-interface {v1, p1}, Lcom/facebook/cache/disk/FileCache;->getResource(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/binaryresource/BinaryResource;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, "Disk cache miss for %s"

    .line 355
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    .line 356
    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onDiskCacheMiss(Lcom/facebook/cache/common/CacheKey;)V

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-string v2, "Found entry in disk cache for %s"

    .line 359
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    .line 360
    invoke-interface {v2, p1}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onDiskCacheHit(Lcom/facebook/cache/common/CacheKey;)V

    .line 362
    invoke-interface {v1}, Lcom/facebook/binaryresource/BinaryResource;->openStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v3, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->pooledByteBufferFactory:Lcom/facebook/common/memory/PooledByteBufferFactory;

    .line 365
    invoke-interface {v1}, Lcom/facebook/binaryresource/BinaryResource;->size()J

    move-result-wide v4

    long-to-int v1, v4

    invoke-interface {v3, v2, v1}, Lcom/facebook/common/memory/PooledByteBufferFactory;->newByteBuffer(Ljava/io/InputStream;I)Lcom/facebook/common/memory/PooledByteBuffer;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 367
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    const-string v2, "Successful read from disk cache for %s"

    .line 369
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    :catchall_0
    move-exception v0

    .line 367
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    .line 375
    move-object v2, v0

    check-cast v2, Ljava/lang/Throwable;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const-string v4, "Exception reading from cache for %s"

    invoke-static {v1, v2, v4, v3}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    .line 376
    invoke-interface {v1, p1}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onDiskCacheGetFail(Lcom/facebook/cache/common/CacheKey;)V

    .line 377
    throw v0
.end method

.method private static final remove$lambda$5(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Ljava/lang/Void;
    .locals 3

    const-string/jumbo v0, "this$0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$key"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 290
    invoke-static {p0, v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeginWork(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 292
    :try_start_0
    iget-object v2, p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    invoke-virtual {v2, p2}, Lcom/facebook/imagepipeline/cache/StagingArea;->remove(Lcom/facebook/cache/common/CacheKey;)Z

    .line 293
    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    invoke-interface {p1, p2}, Lcom/facebook/cache/disk/FileCache;->remove(Lcom/facebook/cache/common/CacheKey;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    return-object v0

    :catchall_0
    move-exception p1

    .line 295
    :try_start_1
    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->markFailure(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 296
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p0

    .line 298
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onEndWork(Ljava/lang/Object;)V

    throw p0
.end method

.method private final writeToDiskCache(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 3

    sget-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    const-string v1, "About to write to disk-cache for key %s"

    .line 387
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    .line 389
    new-instance v2, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda3;

    invoke-direct {v2, p2, p0}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;)V

    invoke-interface {v1, p1, v2}, Lcom/facebook/cache/disk/FileCache;->insert(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/cache/common/WriterCallback;)Lcom/facebook/binaryresource/BinaryResource;

    iget-object p2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    .line 394
    invoke-interface {p2, p1}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->onDiskCachePut(Lcom/facebook/cache/common/CacheKey;)V

    const-string p2, "Successful disk-cache write for key %s"

    .line 395
    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p2, v1}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    sget-object v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    .line 399
    check-cast p2, Ljava/lang/Throwable;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    const-string p1, "Failed to write to disk-cache for key %s"

    invoke-static {v0, p2, p1, v1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private static final writeToDiskCache$lambda$7(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Ljava/io/OutputStream;)V
    .locals 1

    const-string/jumbo v0, "this$0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "os"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 390
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 392
    iget-object p1, p1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->pooledByteStreams:Lcom/facebook/common/memory/PooledByteStreams;

    invoke-virtual {p1, p0, p2}, Lcom/facebook/common/memory/PooledByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    return-void

    .line 391
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Required value was null."

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final addKeyForAsyncProbing(Lcom/facebook/cache/common/CacheKey;)V
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    .line 155
    invoke-interface {v0, p1}, Lcom/facebook/cache/disk/FileCache;->probe(Lcom/facebook/cache/common/CacheKey;)Z

    return-void
.end method

.method public final clearAll()Lbolts/Task;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lbolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    .line 313
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/cache/StagingArea;->clearAll()V

    const-string v0, "BufferedDiskCache_clearAll"

    .line 314
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeforeSubmitWork(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 316
    :try_start_0
    new-instance v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;

    invoke-direct {v1, v0, p0}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->writeExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v1, v0}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lbolts/Task;

    move-result-object v0

    const-string/jumbo v1, "{\n      Task.call(\n     \u2026     writeExecutor)\n    }"

    .line 315
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    .line 334
    move-object v2, v0

    check-cast v2, Ljava/lang/Throwable;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "Failed to schedule disk-cache clear"

    invoke-static {v1, v2, v4, v3}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 335
    invoke-static {v0}, Lbolts/Task;->forError(Ljava/lang/Exception;)Lbolts/Task;

    move-result-object v0

    const-string/jumbo v1, "{\n      // Log failure\n \u2026forError(exception)\n    }"

    .line 331
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    return-object v0
.end method

.method public final contains(Lcom/facebook/cache/common/CacheKey;)Lbolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/cache/common/CacheKey;",
            ")",
            "Lbolts/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->containsSync(Lcom/facebook/cache/common/CacheKey;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    .line 63
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p1}, Lbolts/Task;->forResult(Ljava/lang/Object;)Lbolts/Task;

    move-result-object p1

    const-string/jumbo v0, "{\n        Task.forResult(true)\n      }"

    .line 62
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 65
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->containsAsync(Lcom/facebook/cache/common/CacheKey;)Lbolts/Task;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public final containsSync(Lcom/facebook/cache/common/CacheKey;)Z
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    .line 51
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/StagingArea;->containsKey(Lcom/facebook/cache/common/CacheKey;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    invoke-interface {v0, p1}, Lcom/facebook/cache/disk/FileCache;->hasKeySync(Lcom/facebook/cache/common/CacheKey;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public final diskCheckSync(Lcom/facebook/cache/common/CacheKey;)Z
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->containsSync(Lcom/facebook/cache/common/CacheKey;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    .line 102
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->checkInStagingAreaAndFileCache(Lcom/facebook/cache/common/CacheKey;)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public final get(Lcom/facebook/cache/common/CacheKey;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/cache/common/CacheKey;",
            "Ljava/util/concurrent/atomic/AtomicBoolean;",
            ")",
            "Lbolts/Task<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "isCancelled"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    :try_start_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "BufferedDiskCache#get"

    .line 117
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    .line 119
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/StagingArea;->get(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 120
    invoke-direct {p0, p1, v0}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->foundPinnedImage(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)Lbolts/Task;

    move-result-object v0

    if-nez v0, :cond_2

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->getAsync(Lcom/facebook/cache/common/CacheKey;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    :cond_2
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 123
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_3
    return-object v0

    :catchall_0
    move-exception p1

    .line 122
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 123
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_4
    throw p1
.end method

.method public final getSize()J
    .locals 2

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->fileCache:Lcom/facebook/cache/disk/FileCache;

    .line 340
    invoke-interface {v0}, Lcom/facebook/cache/disk/FileCache;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public final probe(Lcom/facebook/cache/common/CacheKey;)Lbolts/Task;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/cache/common/CacheKey;",
            ")",
            "Lbolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    :try_start_0
    const-string v0, "BufferedDiskCache_probe"

    .line 136
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeforeSubmitWork(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 137
    new-instance v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda6;

    invoke-direct {v1, v0, p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->writeExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v1, v0}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lbolts/Task;

    move-result-object v0

    const-string/jumbo v1, "{\n      val token = Fres\u2026     writeExecutor)\n    }"

    .line 135
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    .line 149
    move-object v2, v0

    check-cast v2, Ljava/lang/Throwable;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v4

    const-string p1, "Failed to schedule disk-cache probe for %s"

    invoke-static {v1, v2, p1, v3}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 150
    invoke-static {v0}, Lbolts/Task;->forError(Ljava/lang/Exception;)Lbolts/Task;

    move-result-object v0

    const-string/jumbo p1, "{\n      FLog.w(TAG, exce\u2026forError(exception)\n    }"

    .line 148
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    return-object v0
.end method

.method public final put(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 7

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "encodedImage"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 242
    :try_start_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "BufferedDiskCache#put"

    .line 243
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 245
    :cond_0
    invoke-static {p2}, Lcom/facebook/imagepipeline/image/EncodedImage;->isValid(Lcom/facebook/imagepipeline/image/EncodedImage;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    .line 248
    invoke-virtual {v0, p1, p2}, Lcom/facebook/imagepipeline/cache/StagingArea;->put(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 253
    invoke-static {p2}, Lcom/facebook/imagepipeline/image/EncodedImage;->cloneOrNull(Lcom/facebook/imagepipeline/image/EncodedImage;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string v1, "BufferedDiskCache_putAsync"

    .line 255
    invoke-static {v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeforeSubmitWork(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->writeExecutor:Ljava/util/concurrent/Executor;

    .line 256
    new-instance v3, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda4;

    invoke-direct {v3, v1, p0, p1, v0}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda4;-><init>(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    sget-object v2, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    .line 272
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "Failed to schedule disk-cache write for %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v2, v1, v3, v4}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    .line 273
    invoke-virtual {v1, p1, p2}, Lcom/facebook/imagepipeline/cache/StagingArea;->remove(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)Z

    .line 274
    invoke-static {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 277
    :goto_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 278
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_1
    return-void

    :cond_2
    :try_start_3
    const-string p1, "Check failed."

    .line 245
    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p1

    .line 277
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 278
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_3
    throw p1
.end method

.method public final remove(Lcom/facebook/cache/common/CacheKey;)Lbolts/Task;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/cache/common/CacheKey;",
            ")",
            "Lbolts/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->stagingArea:Lcom/facebook/imagepipeline/cache/StagingArea;

    .line 285
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/cache/StagingArea;->remove(Lcom/facebook/cache/common/CacheKey;)Z

    :try_start_0
    const-string v0, "BufferedDiskCache_remove"

    .line 287
    invoke-static {v0}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->onBeforeSubmitWork(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 288
    new-instance v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;

    invoke-direct {v1, v0, p0, p1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->writeExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v1, v0}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lbolts/Task;

    move-result-object v0

    const-string/jumbo v1, "{\n      val token = Fres\u2026     writeExecutor)\n    }"

    .line 286
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->TAG:Ljava/lang/Class;

    .line 306
    move-object v2, v0

    check-cast v2, Ljava/lang/Throwable;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-interface {p1}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v4

    const-string p1, "Failed to schedule disk-cache remove for %s"

    invoke-static {v1, v2, p1, v3}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 307
    invoke-static {v0}, Lbolts/Task;->forError(Ljava/lang/Exception;)Lbolts/Task;

    move-result-object v0

    const-string/jumbo p1, "{\n      // Log failure\n \u2026forError(exception)\n    }"

    .line 303
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    return-object v0
.end method
