.class public final Lcom/facebook/react/modules/core/ReactChoreographer;
.super Ljava/lang/Object;
.source "ReactChoreographer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;
    }
.end annotation


# static fields
.field private static sInstance:Lcom/facebook/react/modules/core/ReactChoreographer;


# instance fields
.field private final mCallbackQueues:[Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/ArrayDeque<",
            "Landroid/view/Choreographer$FrameCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mChoreographer:Lcom/facebook/react/internal/ChoreographerProvider$Choreographer;

.field private final mFrameCallback:Landroid/view/Choreographer$FrameCallback;

.field private mHasPostedCallback:Z

.field private mTotalCallbacks:I


# direct methods
.method public static synthetic $r8$lambda$3fVaLnifalsJda_0F7zKTaUXG9o(Lcom/facebook/react/modules/core/ReactChoreographer;Lcom/facebook/react/internal/ChoreographerProvider;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/modules/core/ReactChoreographer;->lambda$new$0(Lcom/facebook/react/internal/ChoreographerProvider;)V

    return-void
.end method

.method public static synthetic $r8$lambda$hKqt-b2qgVZHSzC9XUKtkuJHWcQ(Lcom/facebook/react/modules/core/ReactChoreographer;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/modules/core/ReactChoreographer;->lambda$postFrameCallback$1()V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmCallbackQueues(Lcom/facebook/react/modules/core/ReactChoreographer;)[Ljava/util/ArrayDeque;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mCallbackQueues:[Ljava/util/ArrayDeque;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmTotalCallbacks(Lcom/facebook/react/modules/core/ReactChoreographer;)I
    .locals 0

    iget p0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fputmHasPostedCallback(Lcom/facebook/react/modules/core/ReactChoreographer;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mHasPostedCallback:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmTotalCallbacks(Lcom/facebook/react/modules/core/ReactChoreographer;I)V
    .locals 0

    iput p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mmaybeRemoveFrameCallback(Lcom/facebook/react/modules/core/ReactChoreographer;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/modules/core/ReactChoreographer;->maybeRemoveFrameCallback()V

    return-void
.end method

.method private constructor <init>(Lcom/facebook/react/internal/ChoreographerProvider;)V
    .locals 3

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Lcom/facebook/react/modules/core/ReactChoreographer$1;

    invoke-direct {v0, p0}, Lcom/facebook/react/modules/core/ReactChoreographer$1;-><init>(Lcom/facebook/react/modules/core/ReactChoreographer;)V

    iput-object v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    iput-boolean v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mHasPostedCallback:Z

    .line 105
    invoke-static {}, Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;->values()[Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;

    move-result-object v1

    array-length v1, v1

    new-array v1, v1, [Ljava/util/ArrayDeque;

    iput-object v1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mCallbackQueues:[Ljava/util/ArrayDeque;

    :goto_0
    iget-object v1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mCallbackQueues:[Ljava/util/ArrayDeque;

    .line 106
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 107
    new-instance v2, Ljava/util/ArrayDeque;

    invoke-direct {v2}, Ljava/util/ArrayDeque;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 110
    :cond_0
    new-instance v0, Lcom/facebook/react/modules/core/ReactChoreographer$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/facebook/react/modules/core/ReactChoreographer$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/modules/core/ReactChoreographer;Lcom/facebook/react/internal/ChoreographerProvider;)V

    invoke-static {v0}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static getInstance()Lcom/facebook/react/modules/core/ReactChoreographer;
    .locals 2

    sget-object v0, Lcom/facebook/react/modules/core/ReactChoreographer;->sInstance:Lcom/facebook/react/modules/core/ReactChoreographer;

    const-string v1, "ReactChoreographer needs to be initialized."

    .line 66
    invoke-static {v0, v1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    sget-object v0, Lcom/facebook/react/modules/core/ReactChoreographer;->sInstance:Lcom/facebook/react/modules/core/ReactChoreographer;

    return-object v0
.end method

.method public static initialize(Lcom/facebook/react/internal/ChoreographerProvider;)V
    .locals 1

    sget-object v0, Lcom/facebook/react/modules/core/ReactChoreographer;->sInstance:Lcom/facebook/react/modules/core/ReactChoreographer;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Lcom/facebook/react/modules/core/ReactChoreographer;

    invoke-direct {v0, p0}, Lcom/facebook/react/modules/core/ReactChoreographer;-><init>(Lcom/facebook/react/internal/ChoreographerProvider;)V

    sput-object v0, Lcom/facebook/react/modules/core/ReactChoreographer;->sInstance:Lcom/facebook/react/modules/core/ReactChoreographer;

    :cond_0
    return-void
.end method

.method private synthetic lambda$new$0(Lcom/facebook/react/internal/ChoreographerProvider;)V
    .locals 0

    .line 112
    invoke-interface {p1}, Lcom/facebook/react/internal/ChoreographerProvider;->getChoreographer()Lcom/facebook/react/internal/ChoreographerProvider$Choreographer;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mChoreographer:Lcom/facebook/react/internal/ChoreographerProvider$Choreographer;

    return-void
.end method

.method private synthetic lambda$postFrameCallback$1()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mCallbackQueues:[Ljava/util/ArrayDeque;

    .line 128
    monitor-enter v0

    .line 129
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/modules/core/ReactChoreographer;->postFrameCallbackOnChoreographer()V

    .line 130
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private maybeRemoveFrameCallback()V
    .locals 3

    iget v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    const/4 v1, 0x0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    .line 164
    :goto_0
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(Z)V

    iget v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mHasPostedCallback:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mChoreographer:Lcom/facebook/react/internal/ChoreographerProvider$Choreographer;

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    .line 167
    invoke-interface {v0, v2}, Lcom/facebook/react/internal/ChoreographerProvider$Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    :cond_1
    iput-boolean v1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mHasPostedCallback:Z

    :cond_2
    return-void
.end method

.method private postFrameCallbackOnChoreographer()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mChoreographer:Lcom/facebook/react/internal/ChoreographerProvider$Choreographer;

    iget-object v1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    .line 144
    invoke-interface {v0, v1}, Lcom/facebook/react/internal/ChoreographerProvider$Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mHasPostedCallback:Z

    return-void
.end method


# virtual methods
.method public postFrameCallback(Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;Landroid/view/Choreographer$FrameCallback;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mCallbackQueues:[Ljava/util/ArrayDeque;

    .line 117
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mCallbackQueues:[Ljava/util/ArrayDeque;

    .line 118
    invoke-virtual {p1}, Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;->getOrder()I

    move-result p1

    aget-object p1, v1, p1

    invoke-virtual {p1, p2}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    iget p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    const/4 p2, 0x1

    add-int/2addr p1, p2

    iput p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 120
    :goto_0
    invoke-static {p2}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(Z)V

    iget-boolean p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mHasPostedCallback:Z

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mChoreographer:Lcom/facebook/react/internal/ChoreographerProvider$Choreographer;

    if-nez p1, :cond_1

    .line 126
    new-instance p1, Lcom/facebook/react/modules/core/ReactChoreographer$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/facebook/react/modules/core/ReactChoreographer$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/modules/core/ReactChoreographer;)V

    invoke-static {p1}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 133
    :cond_1
    invoke-direct {p0}, Lcom/facebook/react/modules/core/ReactChoreographer;->postFrameCallbackOnChoreographer()V

    .line 136
    :cond_2
    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeFrameCallback(Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;Landroid/view/Choreographer$FrameCallback;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mCallbackQueues:[Ljava/util/ArrayDeque;

    .line 149
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mCallbackQueues:[Ljava/util/ArrayDeque;

    .line 150
    invoke-virtual {p1}, Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;->getOrder()I

    move-result p1

    aget-object p1, v1, p1

    invoke-virtual {p1, p2}, Ljava/util/ArrayDeque;->removeFirstOccurrence(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/facebook/react/modules/core/ReactChoreographer;->mTotalCallbacks:I

    .line 152
    invoke-direct {p0}, Lcom/facebook/react/modules/core/ReactChoreographer;->maybeRemoveFrameCallback()V

    goto :goto_0

    :cond_0
    const-string p1, "ReactNative"

    const-string p2, "Tried to remove non-existent frame callback"

    .line 154
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
