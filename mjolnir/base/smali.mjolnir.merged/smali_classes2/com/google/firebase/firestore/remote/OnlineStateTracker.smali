.class Lcom/google/firebase/firestore/remote/OnlineStateTracker;
.super Ljava/lang/Object;
.source "OnlineStateTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/remote/OnlineStateTracker$OnlineStateCallback;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "OnlineStateTracker"

.field private static final MAX_WATCH_STREAM_FAILURES:I = 0x1

.field private static final ONLINE_STATE_TIMEOUT_MS:I = 0x2710


# instance fields
.field private final onlineStateCallback:Lcom/google/firebase/firestore/remote/OnlineStateTracker$OnlineStateCallback;

.field private onlineStateTimer:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

.field private shouldWarnClientIsOffline:Z

.field private state:Lcom/google/firebase/firestore/core/OnlineState;

.field private watchStreamFailures:I

.field private final workerQueue:Lcom/google/firebase/firestore/util/AsyncQueue;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/remote/OnlineStateTracker$OnlineStateCallback;)V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->workerQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    iput-object p2, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->onlineStateCallback:Lcom/google/firebase/firestore/remote/OnlineStateTracker$OnlineStateCallback;

    .line 87
    sget-object p1, Lcom/google/firebase/firestore/core/OnlineState;->UNKNOWN:Lcom/google/firebase/firestore/core/OnlineState;

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->state:Lcom/google/firebase/firestore/core/OnlineState;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->shouldWarnClientIsOffline:Z

    return-void
.end method

.method private clearOnlineStateTimer()V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->onlineStateTimer:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {v0}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->onlineStateTimer:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    :cond_0
    return-void
.end method

.method private logClientOfflineWarningIfNecessary(Ljava/lang/String;)V
    .locals 5

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "Could not reach Cloud Firestore backend. %s\nThis typically indicates that your device does not have a healthy Internet connection at the moment. The client will operate in offline mode until it is able to successfully connect to the backend."

    .line 187
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-boolean v1, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->shouldWarnClientIsOffline:Z

    const-string v3, "%s"

    const-string v4, "OnlineStateTracker"

    if-eqz v1, :cond_0

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v2

    .line 195
    invoke-static {v4, v3, v0}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v2, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->shouldWarnClientIsOffline:Z

    goto :goto_0

    :cond_0
    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v2

    .line 198
    invoke-static {v4, v3, v0}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private setAndBroadcastState(Lcom/google/firebase/firestore/core/OnlineState;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->state:Lcom/google/firebase/firestore/core/OnlineState;

    if-eq p1, v0, :cond_0

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->state:Lcom/google/firebase/firestore/core/OnlineState;

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->onlineStateCallback:Lcom/google/firebase/firestore/remote/OnlineStateTracker$OnlineStateCallback;

    .line 181
    invoke-interface {v0, p1}, Lcom/google/firebase/firestore/remote/OnlineStateTracker$OnlineStateCallback;->handleOnlineStateChange(Lcom/google/firebase/firestore/core/OnlineState;)V

    :cond_0
    return-void
.end method


# virtual methods
.method getState()Lcom/google/firebase/firestore/core/OnlineState;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->state:Lcom/google/firebase/firestore/core/OnlineState;

    return-object v0
.end method

.method handleWatchStreamFailure(Lio/grpc/Status;)V
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->state:Lcom/google/firebase/firestore/core/OnlineState;

    .line 137
    sget-object v1, Lcom/google/firebase/firestore/core/OnlineState;->ONLINE:Lcom/google/firebase/firestore/core/OnlineState;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_2

    .line 138
    sget-object p1, Lcom/google/firebase/firestore/core/OnlineState;->UNKNOWN:Lcom/google/firebase/firestore/core/OnlineState;

    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->setAndBroadcastState(Lcom/google/firebase/firestore/core/OnlineState;)V

    iget p1, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->watchStreamFailures:I

    if-nez p1, :cond_0

    move p1, v3

    goto :goto_0

    :cond_0
    move p1, v2

    :goto_0
    const-string v0, "watchStreamFailures must be 0"

    new-array v1, v2, [Ljava/lang/Object;

    .line 142
    invoke-static {p1, v0, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->onlineStateTimer:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    const-string p1, "onlineStateTimer must be null"

    new-array v0, v2, [Ljava/lang/Object;

    .line 143
    invoke-static {v3, p1, v0}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    :cond_2
    iget v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->watchStreamFailures:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->watchStreamFailures:I

    if-lt v0, v3, :cond_3

    .line 147
    invoke-direct {p0}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->clearOnlineStateTimer()V

    .line 148
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    .line 152
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    aput-object p1, v1, v3

    const-string p1, "Connection failed %d times. Most recent error: %s"

    .line 149
    invoke-static {v0, p1, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 148
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->logClientOfflineWarningIfNecessary(Ljava/lang/String;)V

    .line 154
    sget-object p1, Lcom/google/firebase/firestore/core/OnlineState;->OFFLINE:Lcom/google/firebase/firestore/core/OnlineState;

    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->setAndBroadcastState(Lcom/google/firebase/firestore/core/OnlineState;)V

    :cond_3
    :goto_2
    return-void
.end method

.method handleWatchStreamStart()V
    .locals 5

    iget v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->watchStreamFailures:I

    if-nez v0, :cond_1

    .line 104
    sget-object v0, Lcom/google/firebase/firestore/core/OnlineState;->UNKNOWN:Lcom/google/firebase/firestore/core/OnlineState;

    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->setAndBroadcastState(Lcom/google/firebase/firestore/core/OnlineState;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->onlineStateTimer:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v2, "onlineStateTimer shouldn\'t be started yet"

    new-array v1, v1, [Ljava/lang/Object;

    .line 106
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->workerQueue:Lcom/google/firebase/firestore/util/AsyncQueue;

    .line 107
    sget-object v1, Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;->ONLINE_STATE_TIMEOUT:Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

    new-instance v2, Lcom/google/firebase/firestore/remote/OnlineStateTracker$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/google/firebase/firestore/remote/OnlineStateTracker$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/remote/OnlineStateTracker;)V

    const-wide/16 v3, 0x2710

    .line 108
    invoke-virtual {v0, v1, v3, v4, v2}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAfterDelay(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;JLjava/lang/Runnable;)Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->onlineStateTimer:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    :cond_1
    return-void
.end method

.method synthetic lambda$handleWatchStreamStart$0$com-google-firebase-firestore-remote-OnlineStateTracker()V
    .locals 5

    .line 0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->onlineStateTimer:Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->state:Lcom/google/firebase/firestore/core/OnlineState;

    .line 113
    sget-object v1, Lcom/google/firebase/firestore/core/OnlineState;->UNKNOWN:Lcom/google/firebase/firestore/core/OnlineState;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    const-string v1, "Timer should be canceled if we transitioned to a different state."

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v0, v1, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 116
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    new-array v1, v2, [Ljava/lang/Object;

    const/16 v2, 0xa

    .line 120
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    const-string v2, "Backend didn\'t respond within %d seconds\n"

    .line 117
    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->logClientOfflineWarningIfNecessary(Ljava/lang/String;)V

    .line 121
    sget-object v0, Lcom/google/firebase/firestore/core/OnlineState;->OFFLINE:Lcom/google/firebase/firestore/core/OnlineState;

    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->setAndBroadcastState(Lcom/google/firebase/firestore/core/OnlineState;)V

    return-void
.end method

.method updateState(Lcom/google/firebase/firestore/core/OnlineState;)V
    .locals 2

    .line 166
    invoke-direct {p0}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->clearOnlineStateTimer()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->watchStreamFailures:I

    .line 169
    sget-object v1, Lcom/google/firebase/firestore/core/OnlineState;->ONLINE:Lcom/google/firebase/firestore/core/OnlineState;

    if-ne p1, v1, :cond_0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->shouldWarnClientIsOffline:Z

    .line 175
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/OnlineStateTracker;->setAndBroadcastState(Lcom/google/firebase/firestore/core/OnlineState;)V

    return-void
.end method
