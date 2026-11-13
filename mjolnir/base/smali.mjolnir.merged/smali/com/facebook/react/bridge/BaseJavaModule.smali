.class public abstract Lcom/facebook/react/bridge/BaseJavaModule;
.super Ljava/lang/Object;
.source "BaseJavaModule.java"

# interfaces
.implements Lcom/facebook/react/bridge/NativeModule;


# static fields
.field public static final METHOD_TYPE_ASYNC:Ljava/lang/String; = "async"

.field public static final METHOD_TYPE_PROMISE:Ljava/lang/String; = "promise"

.field public static final METHOD_TYPE_SYNC:Ljava/lang/String; = "sync"


# instance fields
.field private final mReactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, v0}, Lcom/facebook/react/bridge/BaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/bridge/BaseJavaModule;->mReactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-void
.end method


# virtual methods
.method public canOverrideExistingModule()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getConstants()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/bridge/BaseJavaModule;->mReactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    const-string v1, "Tried to get ReactApplicationContext even though NativeModule wasn\'t instantiated with one"

    .line 95
    invoke-static {v0, v1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReactApplicationContext;

    return-object v0
.end method

.method protected final getReactApplicationContextIfActiveOrWarn()Lcom/facebook/react/bridge/ReactApplicationContext;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/bridge/BaseJavaModule;->mReactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 115
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->hasActiveReactInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/react/bridge/BaseJavaModule;->mReactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-object v0

    .line 121
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "React Native Instance has already disappeared: requested by "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/facebook/react/bridge/BaseJavaModule;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 125
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    const-string v0, "ReactNative"

    invoke-static {v0, v1}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public initialize()V
    .locals 0

    return-void
.end method

.method public invalidate()V
    .locals 0

    return-void
.end method

.method public synthetic onCatalystInstanceDestroy()V
    .locals 0

    invoke-static {p0}, Lcom/facebook/react/bridge/NativeModule$-CC;->$default$onCatalystInstanceDestroy(Lcom/facebook/react/bridge/NativeModule;)V

    return-void
.end method
