.class public Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;
.super Ljava/lang/Object;
.source "PriorityNetworkFetcher.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/NetworkFetcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$RetriableIOException;,
        Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$NonrecoverableException;,
        Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FETCH_STATE:",
        "Lcom/facebook/imagepipeline/producers/FetchState;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
        "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
        "TFETCH_STATE;>;>;"
    }
.end annotation


# static fields
.field static final INFINITE_REQUEUE:I = -0x1

.field static final NO_DELAYED_REQUESTS:I = -0x1

.field public static final TAG:Ljava/lang/String; = "PriorityNetworkFetcher"


# instance fields
.field private final doNotCancelRequests:Z

.field private firstDelayedRequestEnqueuedTimeStamp:J

.field private final immediateRequeueCount:I

.field private final inflightFetchesCanBeCancelled:Z

.field private volatile isRunning:Z

.field private final mClock:Lcom/facebook/common/time/MonotonicClock;

.field private final mCurrentlyFetching:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;>;"
        }
    .end annotation
.end field

.field private final mDelayedQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;>;"
        }
    .end annotation
.end field

.field private final mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "TFETCH_STATE;>;"
        }
    .end annotation
.end field

.field private final mHiPriQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;>;"
        }
    .end annotation
.end field

.field private final mIsHiPriFifo:Z

.field private final mLock:Ljava/lang/Object;

.field private final mLowPriQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;>;"
        }
    .end annotation
.end field

.field private final mMaxOutstandingHiPri:I

.field private final mMaxOutstandingLowPri:I

.field private final maxAttemptCount:I

.field private final maxConnectAttemptCount:I

.field private final maxNumberOfRequeue:I

.field private final multipleDequeue:Z

.field private final nonRecoverableExceptionPreventsRequeue:Z

.field private final requeueDelayTimeInMillis:J

.field private final retryLowPriAll:Z

.field private final retryLowPriConnectionException:Z

.field private final retryLowPriUnknownHostException:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/producers/NetworkFetcher;ZIIZIZIIZZIIZZZ)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "TFETCH_STATE;>;ZIIZIZIIZZIIZZZ)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move/from16 v12, p12

    move/from16 v13, p13

    move/from16 v14, p14

    move/from16 v15, p15

    move/from16 v16, p16

    .line 152
    invoke-static {}, Lcom/facebook/common/time/RealtimeSinceBootClock;->get()Lcom/facebook/common/time/RealtimeSinceBootClock;

    move-result-object v17

    .line 135
    invoke-direct/range {v0 .. v17}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;-><init>(Lcom/facebook/imagepipeline/producers/NetworkFetcher;ZIIZIZIIZZIIZZZLcom/facebook/common/time/MonotonicClock;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/producers/NetworkFetcher;ZIIZIZIIZZIIZZZLcom/facebook/common/time/MonotonicClock;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "TFETCH_STATE;>;ZIIZIZIIZZIIZZZ",
            "Lcom/facebook/common/time/MonotonicClock;",
            ")V"
        }
    .end annotation

    move-object v0, p0

    move v1, p3

    move v2, p4

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLock:Ljava/lang/Object;

    .line 66
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 68
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 70
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    .line 72
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->isRunning:Z

    move-object v3, p1

    iput-object v3, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    move v3, p2

    iput-boolean v3, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mIsHiPriFifo:Z

    iput v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mMaxOutstandingHiPri:I

    iput v2, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mMaxOutstandingLowPri:I

    if-le v1, v2, :cond_0

    move v1, p5

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->inflightFetchesCanBeCancelled:Z

    move v1, p6

    iput v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->maxNumberOfRequeue:I

    move v1, p7

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->doNotCancelRequests:Z

    move v1, p8

    iput v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->immediateRequeueCount:I

    move v1, p9

    int-to-long v1, v1

    iput-wide v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->requeueDelayTimeInMillis:J

    move v1, p10

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->multipleDequeue:Z

    move v1, p11

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->nonRecoverableExceptionPreventsRequeue:Z

    move/from16 v1, p12

    iput v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->maxConnectAttemptCount:I

    move/from16 v1, p13

    iput v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->maxAttemptCount:I

    move/from16 v1, p14

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->retryLowPriAll:Z

    move/from16 v1, p15

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->retryLowPriUnknownHostException:Z

    move/from16 v1, p16

    iput-boolean v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->retryLowPriConnectionException:Z

    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mClock:Lcom/facebook/common/time/MonotonicClock;

    return-void

    .line 180
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "maxOutstandingHiPri should be > maxOutstandingLowPri"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic access$000(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z
    .locals 0

    .line 54
    iget-boolean p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->doNotCancelRequests:Z

    return p0
.end method

.method static synthetic access$100(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z
    .locals 0

    .line 54
    iget-boolean p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->inflightFetchesCanBeCancelled:Z

    return p0
.end method

.method static synthetic access$1000(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->retry(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)I
    .locals 0

    .line 54
    iget p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->maxNumberOfRequeue:I

    return p0
.end method

.method static synthetic access$1200(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z
    .locals 0

    .line 54
    iget-boolean p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->nonRecoverableExceptionPreventsRequeue:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->requeue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V

    return-void
.end method

.method static synthetic access$200(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Ljava/util/HashSet;
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    return-object p0
.end method

.method static synthetic access$300(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Ljava/lang/String;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->removeFromQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Z)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->changePriority(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)I
    .locals 0

    .line 54
    iget p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->maxConnectAttemptCount:I

    return p0
.end method

.method static synthetic access$600(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)I
    .locals 0

    .line 54
    iget p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->maxAttemptCount:I

    return p0
.end method

.method static synthetic access$700(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z
    .locals 0

    .line 54
    iget-boolean p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->retryLowPriAll:Z

    return p0
.end method

.method static synthetic access$800(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z
    .locals 0

    .line 54
    iget-boolean p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->retryLowPriUnknownHostException:Z

    return p0
.end method

.method static synthetic access$900(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z
    .locals 0

    .line 54
    iget-boolean p0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->retryLowPriConnectionException:Z

    return p0
.end method

.method private changePriority(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;Z)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLock:Ljava/lang/Object;

    .line 442
    monitor-enter v0

    if-eqz p2, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 444
    :goto_0
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    goto :goto_0

    :goto_1
    if-nez v1, :cond_1

    .line 446
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->changePriorityInDelayedQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V

    .line 447
    monitor-exit v0

    return-void

    :cond_1
    sget-object v1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->TAG:Ljava/lang/String;

    const-string v2, "change-pri: %s %s"

    if-eqz p2, :cond_2

    const-string v3, "HIPRI"

    goto :goto_2

    :cond_2
    const-string v3, "LOWPRI"

    .line 450
    :goto_2
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 452
    iget v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->priorityChangedCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->priorityChangedCount:I

    .line 453
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->putInQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Z)V

    .line 454
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 455
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->dequeueIfAvailableSlots()V

    return-void

    :catchall_0
    move-exception p1

    .line 454
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private changePriorityInDelayedQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    .line 431
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 436
    :cond_0
    iget v0, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->priorityChangedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->priorityChangedCount:I

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    .line 437
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    return-void
.end method

.method private delegateFetch(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;)V"
        }
    .end annotation

    .line 372
    :try_start_0
    new-instance v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;-><init>(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V

    .line 422
    iget v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->attemptCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->attemptCount:I

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    .line 423
    iget-object v2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delegatedState:Lcom/facebook/imagepipeline/producers/FetchState;

    invoke-interface {v1, v2, v0}, Lcom/facebook/imagepipeline/producers/NetworkFetcher;->fetch(Lcom/facebook/imagepipeline/producers/FetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "FAIL"

    .line 425
    invoke-direct {p0, p1, v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->removeFromQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private dequeueIfAvailableSlots()V
    .locals 10

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->isRunning:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLock:Ljava/lang/Object;

    .line 336
    monitor-enter v0

    .line 337
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->moveDelayedRequestsToPriorityQueues()V

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    .line 338
    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v1

    iget v2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mMaxOutstandingHiPri:I

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 341
    invoke-virtual {v2}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_2

    iget v3, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mMaxOutstandingLowPri:I

    if-ge v1, v3, :cond_2

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 345
    invoke-virtual {v2}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    :cond_2
    if-nez v2, :cond_3

    .line 348
    monitor-exit v0

    return-void

    :cond_3
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 350
    invoke-interface {v3}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v3

    iput-wide v3, v2, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->dequeuedTimestamp:J

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    .line 351
    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v4, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->TAG:Ljava/lang/String;

    const-string v5, "fetching: %s (concurrent: %s hi-pri queue: %s low-pri queue: %s)"

    .line 356
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getUri()Landroid/net/Uri;

    move-result-object v6

    .line 357
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 358
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 359
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 353
    invoke-static/range {v4 .. v9}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 360
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 362
    invoke-direct {p0, v2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->delegateFetch(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->multipleDequeue:Z

    if-eqz v0, :cond_4

    .line 365
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->dequeueIfAvailableSlots()V

    :cond_4
    return-void

    :catchall_0
    move-exception v1

    .line 360
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private moveDelayedRequestsToPriorityQueues()V
    .locals 4

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    .line 273
    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 274
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->firstDelayedRequestEnqueuedTimeStamp:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->requeueDelayTimeInMillis:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    goto :goto_2

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    .line 277
    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 278
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v2

    invoke-interface {v2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getPriority()Lcom/facebook/imagepipeline/common/Priority;

    move-result-object v2

    sget-object v3, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    if-ne v2, v3, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-direct {p0, v1, v2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->putInQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Z)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    .line 280
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    :cond_3
    :goto_2
    return-void
.end method

.method private putInDelayedQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    .line 285
    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 286
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->firstDelayedRequestEnqueuedTimeStamp:J

    .line 288
    :cond_0
    iget v0, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delayCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delayCount:I

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    .line 289
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    return-void
.end method

.method private putInQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;Z)V"
        }
    .end annotation

    if-eqz p2, :cond_1

    iget-boolean p2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mIsHiPriFifo:Z

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 462
    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 464
    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 467
    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private removeFromQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLock:Ljava/lang/Object;

    .line 262
    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->TAG:Ljava/lang/String;

    const-string v2, "remove: %s %s"

    .line 263
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v1, v2, p2, v3}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    .line 264
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 265
    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 266
    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 268
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->dequeueIfAvailableSlots()V

    return-void

    :catchall_0
    move-exception p1

    .line 268
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private requeue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLock:Ljava/lang/Object;

    .line 308
    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->TAG:Ljava/lang/String;

    const-string v2, "requeue: %s"

    .line 309
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 311
    iget v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->requeueCount:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->requeueCount:I

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    .line 313
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v3

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Lcom/facebook/imagepipeline/producers/NetworkFetcher;->createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/facebook/imagepipeline/producers/FetchState;

    move-result-object v1

    iput-object v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delegatedState:Lcom/facebook/imagepipeline/producers/FetchState;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    .line 315
    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 316
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 317
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    :cond_0
    iget v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->immediateRequeueCount:I

    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 320
    iget v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->requeueCount:I

    iget v3, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->immediateRequeueCount:I

    if-le v1, v3, :cond_1

    .line 322
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->putInDelayedQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V

    goto :goto_1

    .line 324
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getPriority()Lcom/facebook/imagepipeline/common/Priority;

    move-result-object v1

    sget-object v3, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    if-ne v1, v3, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    invoke-direct {p0, p1, v2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->putInQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Z)V

    .line 326
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 327
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->dequeueIfAvailableSlots()V

    return-void

    :catchall_0
    move-exception p1

    .line 326
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private retry(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;)V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->TAG:Ljava/lang/String;

    const-string v1, "retry: %s"

    .line 293
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLock:Ljava/lang/Object;

    .line 294
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    .line 296
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v2

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/facebook/imagepipeline/producers/NetworkFetcher;->createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/facebook/imagepipeline/producers/FetchState;

    move-result-object v1

    iput-object v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delegatedState:Lcom/facebook/imagepipeline/producers/FetchState;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    .line 298
    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 299
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 300
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    :cond_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 302
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 303
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 304
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->dequeueIfAvailableSlots()V

    return-void

    :catchall_0
    move-exception p1

    .line 303
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public static shouldRetry(Ljava/lang/Throwable;IIIZZZLcom/facebook/imagepipeline/common/Priority;)Z
    .locals 2

    .line 628
    instance-of v0, p0, Ljava/net/ConnectException;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    if-lt p1, p2, :cond_0

    return v1

    :cond_0
    if-lt p1, p3, :cond_1

    return v1

    .line 636
    :cond_1
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    const/4 p2, 0x1

    if-ne p7, p1, :cond_2

    move p1, p2

    goto :goto_0

    :cond_2
    move p1, v1

    :goto_0
    if-nez p4, :cond_3

    if-nez p1, :cond_3

    .line 639
    invoke-static {p0, p5, p6}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->shouldRetryLowPrioritySpecificExceptions(Ljava/lang/Throwable;ZZ)Z

    move-result p0

    return p0

    :cond_3
    if-eqz p1, :cond_4

    .line 643
    instance-of p3, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$NonrecoverableException;

    if-eqz p3, :cond_4

    return p2

    .line 647
    :cond_4
    instance-of p3, p0, Ljava/net/SocketTimeoutException;

    if-nez p3, :cond_c

    instance-of p3, p0, Ljava/net/UnknownHostException;

    if-nez p3, :cond_c

    if-nez v0, :cond_c

    instance-of p3, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$RetriableIOException;

    if-eqz p3, :cond_5

    goto :goto_1

    .line 653
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_6

    return v1

    .line 657
    :cond_6
    instance-of p4, p0, Ljava/io/IOException;

    if-eqz p4, :cond_7

    const-string p5, "Canceled"

    invoke-virtual {p3, p5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p5

    if-nez p5, :cond_a

    :cond_7
    if-eqz p4, :cond_8

    const-string/jumbo p4, "unexpected end of stream on null"

    .line 658
    invoke-virtual {p3, p4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_a

    :cond_8
    instance-of p4, p0, Ljava/net/SocketException;

    if-eqz p4, :cond_9

    const-string p4, "Socket closed"

    .line 659
    invoke-virtual {p3, p4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_a

    :cond_9
    if-eqz p1, :cond_b

    instance-of p0, p0, Ljava/io/InterruptedIOException;

    if-eqz p0, :cond_b

    const-string/jumbo p0, "timeout"

    .line 660
    invoke-virtual {p3, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_b

    :cond_a
    move v1, p2

    :cond_b
    return v1

    :cond_c
    :goto_1
    return p2
.end method

.method private static shouldRetryLowPrioritySpecificExceptions(Ljava/lang/Throwable;ZZ)Z
    .locals 1

    .line 608
    instance-of v0, p0, Ljava/net/UnknownHostException;

    if-eqz v0, :cond_0

    return p1

    .line 612
    :cond_0
    instance-of p0, p0, Ljava/net/ConnectException;

    if-eqz p0, :cond_1

    return p2

    :cond_1
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public bridge synthetic createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/facebook/imagepipeline/producers/FetchState;
    .locals 0

    .line 53
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    move-result-object p1

    return-object p1
.end method

.method public createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;"
        }
    .end annotation

    .line 568
    new-instance v10, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    .line 571
    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/NetworkFetcher;->createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/facebook/imagepipeline/producers/FetchState;

    move-result-object v3

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 572
    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v4

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    .line 573
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v6

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    .line 574
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v7

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    .line 575
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v8

    const/4 v9, 0x0

    move-object v0, v10

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v9}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/producers/FetchState;JIIILcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$1;)V

    return-object v10
.end method

.method public bridge synthetic fetch(Lcom/facebook/imagepipeline/producers/FetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 0

    .line 53
    check-cast p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->fetch(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V

    return-void
.end method

.method public fetch(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;",
            ")V"
        }
    .end annotation

    const-string v0, "fetch state was enqueued twice: "

    .line 218
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v1

    new-instance v2, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$1;

    invoke-direct {v2, p0, p1, p2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$1;-><init>(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V

    .line 219
    invoke-interface {v1, v2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLock:Ljava/lang/Object;

    .line 239
    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    .line 240
    invoke-virtual {v2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object p2, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->TAG:Ljava/lang/String;

    .line 241
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    monitor-exit v1

    return-void

    .line 245
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getPriority()Lcom/facebook/imagepipeline/common/Priority;

    move-result-object v0

    sget-object v2, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    if-ne v0, v2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    sget-object v2, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->TAG:Ljava/lang/String;

    const-string v3, "enqueue: %s %s"

    if-eqz v0, :cond_2

    const-string v4, "HI-PRI"

    goto :goto_1

    :cond_2
    const-string v4, "LOW-PRI"

    .line 246
    :goto_1
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 247
    iput-object p2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    .line 248
    invoke-direct {p0, p1, v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->putInQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Z)V

    .line 249
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 250
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->dequeueIfAvailableSlots()V

    return-void

    :catchall_0
    move-exception p1

    .line 249
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method getCurrentlyFetching()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mCurrentlyFetching:Ljava/util/HashSet;

    return-object v0
.end method

.method getDelayedQeueue()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelayedQueue:Ljava/util/LinkedList;

    return-object v0
.end method

.method public bridge synthetic getExtraMap(Lcom/facebook/imagepipeline/producers/FetchState;I)Ljava/util/Map;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 53
    check-cast p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->getExtraMap(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;I)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public getExtraMap(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;I)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    .line 588
    iget-object v1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delegatedState:Lcom/facebook/imagepipeline/producers/FetchState;

    invoke-interface {v0, v1, p2}, Lcom/facebook/imagepipeline/producers/NetworkFetcher;->getExtraMap(Lcom/facebook/imagepipeline/producers/FetchState;I)Ljava/util/Map;

    move-result-object p2

    .line 590
    new-instance v0, Ljava/util/HashMap;

    if-eqz p2, :cond_0

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 591
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->dequeuedTimestamp:J

    iget-wide v4, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->enqueuedTimestamp:J

    sub-long/2addr v2, v4

    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "pri_queue_time"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 593
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->hiPriCountWhenCreated:I

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "hipri_queue_size"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->lowPriCountWhenCreated:I

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "lowpri_queue_size"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->requeueCount:I

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "requeueCount"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->priorityChangedCount:I

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "priority_changed_count"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 597
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->isInitialPriorityHigh:Z

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "request_initial_priority_is_high"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 598
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->currentlyFetchingCountWhenCreated:I

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "currently_fetching_size"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 599
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delayCount:I

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "delay_count"

    invoke-virtual {v0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method getHiPriQueue()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mHiPriQueue:Ljava/util/LinkedList;

    return-object v0
.end method

.method getLowPriQueue()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mLowPriQueue:Ljava/util/LinkedList;

    return-object v0
.end method

.method public bridge synthetic onFetchCompletion(Lcom/facebook/imagepipeline/producers/FetchState;I)V
    .locals 0

    .line 53
    check-cast p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->onFetchCompletion(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;I)V

    return-void
.end method

.method public onFetchCompletion(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;I)V"
        }
    .end annotation

    const-string v0, "SUCCESS"

    .line 256
    invoke-direct {p0, p1, v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->removeFromQueue(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    .line 257
    iget-object p1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delegatedState:Lcom/facebook/imagepipeline/producers/FetchState;

    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/NetworkFetcher;->onFetchCompletion(Lcom/facebook/imagepipeline/producers/FetchState;I)V

    return-void
.end method

.method public pause()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->isRunning:Z

    return-void
.end method

.method public resume()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->isRunning:Z

    .line 210
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->dequeueIfAvailableSlots()V

    return-void
.end method

.method public bridge synthetic shouldPropagate(Lcom/facebook/imagepipeline/producers/FetchState;)Z
    .locals 0

    .line 53
    check-cast p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->shouldPropagate(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)Z

    move-result p1

    return p1
.end method

.method public shouldPropagate(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState<",
            "TFETCH_STATE;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->mDelegate:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    .line 581
    iget-object p1, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->delegatedState:Lcom/facebook/imagepipeline/producers/FetchState;

    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/producers/NetworkFetcher;->shouldPropagate(Lcom/facebook/imagepipeline/producers/FetchState;)Z

    move-result p1

    return p1
.end method
