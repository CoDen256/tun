.class public Lcom/reactnativegooglesignin/PromiseWrapper;
.super Ljava/lang/Object;
.source "PromiseWrapper.java"


# static fields
.field public static final ASYNC_OP_IN_PROGRESS:Ljava/lang/String; = "ASYNC_OP_IN_PROGRESS"


# instance fields
.field private final MODULE_NAME:Ljava/lang/String;

.field private nameOfCallInProgress:Ljava/lang/String;

.field private promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->MODULE_NAME:Ljava/lang/String;

    return-void
.end method

.method private rejectPreviousPromiseBecauseNewOneIsInProgress(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V
    .locals 2

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Warning: previous promise did not settle and was overwritten. You\'ve called \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\" while \""

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/PromiseWrapper;->getNameOfCallInProgress()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\" was already in progress and has not completed yet."

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "ASYNC_OP_IN_PROGRESS"

    .line 74
    invoke-interface {p1, v0, p2}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private resetMembers()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->nameOfCallInProgress:Ljava/lang/String;

    iput-object v0, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->promise:Lcom/facebook/react/bridge/Promise;

    return-void
.end method


# virtual methods
.method public getNameOfCallInProgress()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->nameOfCallInProgress:Ljava/lang/String;

    return-object v0
.end method

.method public reject(Ljava/lang/Exception;)V
    .locals 3

    iget-object v0, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->promise:Lcom/facebook/react/bridge/Promise;

    iget-object v1, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->nameOfCallInProgress:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->MODULE_NAME:Ljava/lang/String;

    const-string v0, "cannot reject promise because it\'s null"

    .line 55
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 58
    :cond_0
    new-instance v2, Lcom/reactnativegooglesignin/ErrorDto;

    invoke-direct {v2, p1, v1}, Lcom/reactnativegooglesignin/ErrorDto;-><init>(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 60
    invoke-direct {p0}, Lcom/reactnativegooglesignin/PromiseWrapper;->resetMembers()V

    .line 61
    invoke-virtual {v2}, Lcom/reactnativegooglesignin/ErrorDto;->getCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2}, Lcom/reactnativegooglesignin/ErrorDto;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->nameOfCallInProgress:Ljava/lang/String;

    .line 38
    invoke-virtual {p0, v0, p1}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public reject(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->promise:Lcom/facebook/react/bridge/Promise;

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->MODULE_NAME:Ljava/lang/String;

    const-string p2, "cannot reject promise because it\'s null"

    .line 44
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 48
    :cond_0
    invoke-direct {p0}, Lcom/reactnativegooglesignin/PromiseWrapper;->resetMembers()V

    .line 49
    invoke-interface {v0, p1, p2}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public resolve(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->promise:Lcom/facebook/react/bridge/Promise;

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->MODULE_NAME:Ljava/lang/String;

    const-string v0, "cannot resolve promise because it\'s null"

    .line 29
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 33
    :cond_0
    invoke-direct {p0}, Lcom/reactnativegooglesignin/PromiseWrapper;->resetMembers()V

    .line 34
    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public setPromiseWithInProgressCheck(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->promise:Lcom/facebook/react/bridge/Promise;

    if-eqz v0, :cond_0

    .line 20
    invoke-direct {p0, v0, p2}, Lcom/reactnativegooglesignin/PromiseWrapper;->rejectPreviousPromiseBecauseNewOneIsInProgress(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V

    :cond_0
    iput-object p1, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->promise:Lcom/facebook/react/bridge/Promise;

    iput-object p2, p0, Lcom/reactnativegooglesignin/PromiseWrapper;->nameOfCallInProgress:Ljava/lang/String;

    return-void
.end method
