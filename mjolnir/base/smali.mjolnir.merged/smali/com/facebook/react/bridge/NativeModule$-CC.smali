.class public final synthetic Lcom/facebook/react/bridge/NativeModule$-CC;
.super Ljava/lang/Object;
.source "NativeModule.java"


# direct methods
.method public static $default$canOverrideExistingModule(Lcom/facebook/react/bridge/NativeModule;)Z
    .locals 1
    .param p0, "_this"    # Lcom/facebook/react/bridge/NativeModule;

    .line 0
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$onCatalystInstanceDestroy(Lcom/facebook/react/bridge/NativeModule;)V
    .locals 0
    .param p0, "_this"    # Lcom/facebook/react/bridge/NativeModule;
    .annotation runtime Ljava/lang/Deprecated;
        forRemoval = true
        since = "Use invalidate method instead"
    .end annotation

    .line 0
    return-void
.end method
