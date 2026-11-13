.class public Lcom/google/firebase/firestore/util/ExponentialBackoff;
.super Ljava/lang/Object;
.source "ExponentialBackoff.java"


# static fields
.field public static final DEFAULT_BACKOFF_FACTOR:D = 1.5

.field public static final DEFAULT_BACKOFF_INITIAL_DELAY_MS:J = 0x3e8L

.field public static final DEFAULT_BACKOFF_MAX_DELAY_MS:J = 0xea60L


# instance fields
.field private final backoffFactor:D

.field private currentBaseMs:J

.field private final initialDelayMs:J

.field private lastAttemptTime:J

.field private final maxDelayMs:J

.field private nextMaxDelayMs:J

.field private final queue:Lcom/google/firebase/firestore/util/AsyncQueue;

.field private final timerId:Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

.field private timerTask:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;)V
    .locals 9

    const-wide/16 v3, 0x3e8

    const-wide/high16 v5, 0x3ff8000000000000L    # 1.5

    const-wide/32 v7, 0xea60

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 88
    invoke-direct/range {v0 .. v8}, Lcom/google/firebase/firestore/util/ExponentialBackoff;-><init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;JDJ)V

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;JDJ)V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->queue:Lcom/google/firebase/firestore/util/AsyncQueue;

    iput-object p2, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->timerId:Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

    iput-wide p3, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->initialDelayMs:J

    iput-wide p5, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->backoffFactor:D

    iput-wide p7, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->maxDelayMs:J

    iput-wide p7, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->nextMaxDelayMs:J

    .line 82
    new-instance p1, Ljava/util/Date;

    invoke-direct {p1}, Ljava/util/Date;-><init>()V

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->lastAttemptTime:J

    .line 84
    invoke-virtual {p0}, Lcom/google/firebase/firestore/util/ExponentialBackoff;->reset()V

    return-void
.end method

.method private jitterDelayMs()J
    .locals 4

    .line 186
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    sub-double/2addr v0, v2

    iget-wide v2, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    long-to-double v2, v2

    mul-double/2addr v0, v2

    double-to-long v0, v0

    return-wide v0
.end method


# virtual methods
.method public backoffAndRun(Ljava/lang/Runnable;)V
    .locals 10

    .line 132
    invoke-virtual {p0}, Lcom/google/firebase/firestore/util/ExponentialBackoff;->cancel()V

    iget-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    .line 135
    invoke-direct {p0}, Lcom/google/firebase/firestore/util/ExponentialBackoff;->jitterDelayMs()J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 138
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->lastAttemptTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sub-long v6, v0, v2

    .line 141
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    iget-wide v8, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    cmp-long v4, v8, v4

    if-lez v4, :cond_0

    .line 145
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    .line 150
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v5, v8

    iget-wide v8, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    .line 151
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x1

    aput-object v8, v5, v9

    const/4 v8, 0x2

    .line 152
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v5, v8

    const/4 v0, 0x3

    .line 153
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v5, v0

    const-string v0, "Backing off for %d ms (base delay: %d ms, delay with jitter: %d ms, last attempt: %d ms ago)"

    .line 144
    invoke-static {v4, v0, v5}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->queue:Lcom/google/firebase/firestore/util/AsyncQueue;

    iget-object v1, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->timerId:Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

    .line 156
    new-instance v2, Lcom/google/firebase/firestore/util/ExponentialBackoff$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1}, Lcom/google/firebase/firestore/util/ExponentialBackoff$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/util/ExponentialBackoff;Ljava/lang/Runnable;)V

    .line 157
    invoke-virtual {v0, v1, v6, v7, v2}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAfterDelay(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;JLjava/lang/Runnable;)Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->timerTask:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    iget-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    long-to-double v0, v0

    iget-wide v2, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->backoffFactor:D

    mul-double/2addr v0, v2

    double-to-long v0, v0

    iput-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    iget-wide v2, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->initialDelayMs:J

    cmp-long p1, v0, v2

    if-gez p1, :cond_1

    iput-wide v2, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    goto :goto_0

    :cond_1
    iget-wide v2, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->nextMaxDelayMs:J

    cmp-long p1, v0, v2

    if-lez p1, :cond_2

    iput-wide v2, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    :cond_2
    :goto_0
    iget-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->maxDelayMs:J

    iput-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->nextMaxDelayMs:J

    return-void
.end method

.method public cancel()V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->timerTask:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    if-eqz v0, :cond_0

    .line 179
    invoke-virtual {v0}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->timerTask:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    :cond_0
    return-void
.end method

.method synthetic lambda$backoffAndRun$0$com-google-firebase-firestore-util-ExponentialBackoff(Ljava/lang/Runnable;)V
    .locals 2

    .line 161
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->lastAttemptTime:J

    .line 162
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public reset()V
    .locals 2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    return-void
.end method

.method public resetToMax()V
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->nextMaxDelayMs:J

    iput-wide v0, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->currentBaseMs:J

    return-void
.end method

.method public setTemporaryMaxDelay(J)V
    .locals 0

    iput-wide p1, p0, Lcom/google/firebase/firestore/util/ExponentialBackoff;->nextMaxDelayMs:J

    return-void
.end method
