.class public Lcom/facebook/react/fabric/StateWrapperImpl;
.super Ljava/lang/Object;
.source "StateWrapperImpl.java"

# interfaces
.implements Lcom/facebook/react/uimanager/StateWrapper;


# static fields
.field private static final TAG:Ljava/lang/String; = "StateWrapperImpl"


# instance fields
.field private volatile mDestroyed:Z

.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 32
    invoke-static {}, Lcom/facebook/react/fabric/FabricSoLoader;->staticInit()V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mDestroyed:Z

    .line 41
    invoke-static {}, Lcom/facebook/react/fabric/StateWrapperImpl;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private native getStateDataImpl()Lcom/facebook/react/bridge/ReadableNativeMap;
.end method

.method private native getStateMapBufferDataImpl()Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;
.end method

.method private static native initHybrid()Lcom/facebook/jni/HybridData;
.end method


# virtual methods
.method public destroyState()V
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mDestroyed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mDestroyed:Z

    iget-object v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 85
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    :cond_0
    return-void
.end method

.method public getStateData()Lcom/facebook/react/bridge/ReadableNativeMap;
    .locals 2

    iget-boolean v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mDestroyed:Z

    if-eqz v0, :cond_0

    const-string v0, "StateWrapperImpl"

    const-string v1, "Race between StateWrapperImpl destruction and getState"

    .line 66
    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    .line 69
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/fabric/StateWrapperImpl;->getStateDataImpl()Lcom/facebook/react/bridge/ReadableNativeMap;

    move-result-object v0

    return-object v0
.end method

.method public getStateDataMapBuffer()Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;
    .locals 2

    iget-boolean v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mDestroyed:Z

    if-eqz v0, :cond_0

    const-string v0, "StateWrapperImpl"

    const-string v1, "Race between StateWrapperImpl destruction and getState"

    .line 56
    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    .line 59
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/fabric/StateWrapperImpl;->getStateMapBufferDataImpl()Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mDestroyed:Z

    if-eqz v0, :cond_0

    const-string v0, "<destroyed>"

    return-object v0

    .line 95
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/fabric/StateWrapperImpl;->getStateDataImpl()Lcom/facebook/react/bridge/ReadableNativeMap;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "<unexpected null>"

    return-object v0

    .line 100
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReadableNativeMap;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateState(Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/fabric/StateWrapperImpl;->mDestroyed:Z

    if-eqz v0, :cond_0

    const-string p1, "StateWrapperImpl"

    const-string v0, "Race between StateWrapperImpl destruction and updateState"

    .line 75
    invoke-static {p1, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 78
    :cond_0
    check-cast p1, Lcom/facebook/react/bridge/NativeMap;

    invoke-virtual {p0, p1}, Lcom/facebook/react/fabric/StateWrapperImpl;->updateStateImpl(Lcom/facebook/react/bridge/NativeMap;)V

    return-void
.end method

.method public native updateStateImpl(Lcom/facebook/react/bridge/NativeMap;)V
.end method
