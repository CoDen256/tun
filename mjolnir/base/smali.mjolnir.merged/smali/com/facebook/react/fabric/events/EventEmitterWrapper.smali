.class public Lcom/facebook/react/fabric/events/EventEmitterWrapper;
.super Ljava/lang/Object;
.source "EventEmitterWrapper.java"


# instance fields
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 29
    invoke-static {}, Lcom/facebook/react/fabric/FabricSoLoader;->staticInit()V

    return-void
.end method

.method private constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/fabric/events/EventEmitterWrapper;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private native dispatchEvent(Ljava/lang/String;Lcom/facebook/react/bridge/NativeMap;I)V
.end method

.method private native dispatchUniqueEvent(Ljava/lang/String;Lcom/facebook/react/bridge/NativeMap;)V
.end method

.method private isValid()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/fabric/events/EventEmitterWrapper;->mHybridData:Lcom/facebook/jni/HybridData;

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/fabric/events/EventEmitterWrapper;->mHybridData:Lcom/facebook/jni/HybridData;

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized dispatch(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;I)V
    .locals 1

    monitor-enter p0

    .line 54
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/fabric/events/EventEmitterWrapper;->isValid()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 55
    monitor-exit p0

    return-void

    .line 57
    :cond_0
    :try_start_1
    check-cast p2, Lcom/facebook/react/bridge/NativeMap;

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/fabric/events/EventEmitterWrapper;->dispatchEvent(Ljava/lang/String;Lcom/facebook/react/bridge/NativeMap;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized dispatchUnique(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1

    monitor-enter p0

    .line 68
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/react/fabric/events/EventEmitterWrapper;->isValid()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 69
    monitor-exit p0

    return-void

    .line 71
    :cond_0
    :try_start_1
    check-cast p2, Lcom/facebook/react/bridge/NativeMap;

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/fabric/events/EventEmitterWrapper;->dispatchUniqueEvent(Ljava/lang/String;Lcom/facebook/react/bridge/NativeMap;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
