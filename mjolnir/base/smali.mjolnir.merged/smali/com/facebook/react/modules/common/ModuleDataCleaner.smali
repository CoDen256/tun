.class public Lcom/facebook/react/modules/common/ModuleDataCleaner;
.super Ljava/lang/Object;
.source "ModuleDataCleaner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/modules/common/ModuleDataCleaner$Cleanable;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cleanDataFromModules(Lcom/facebook/react/bridge/CatalystInstance;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 49
    invoke-interface {p0}, Lcom/facebook/react/bridge/CatalystInstance;->getNativeModules()Ljava/util/Collection;

    move-result-object p0

    invoke-static {p0}, Lcom/facebook/react/modules/common/ModuleDataCleaner;->cleanDataFromModules(Ljava/util/Collection;)V

    return-void
.end method

.method public static cleanDataFromModules(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 53
    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContext;->getNativeModules()Ljava/util/Collection;

    move-result-object p0

    invoke-static {p0}, Lcom/facebook/react/modules/common/ModuleDataCleaner;->cleanDataFromModules(Ljava/util/Collection;)V

    return-void
.end method

.method private static cleanDataFromModules(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;)V"
        }
    .end annotation

    .line 57
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/NativeModule;

    .line 58
    instance-of v1, v0, Lcom/facebook/react/modules/common/ModuleDataCleaner$Cleanable;

    if-eqz v1, :cond_0

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cleaning data from "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lcom/facebook/react/bridge/NativeModule;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ReactNative"

    invoke-static {v2, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    check-cast v0, Lcom/facebook/react/modules/common/ModuleDataCleaner$Cleanable;

    invoke-interface {v0}, Lcom/facebook/react/modules/common/ModuleDataCleaner$Cleanable;->clearSensitiveData()V

    goto :goto_0

    :cond_1
    return-void
.end method
