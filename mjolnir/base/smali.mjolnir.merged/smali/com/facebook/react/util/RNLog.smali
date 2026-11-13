.class public Lcom/facebook/react/util/RNLog;
.super Ljava/lang/Object;
.source "RNLog.java"


# static fields
.field public static final ADVICE:I = 0x4

.field public static final ERROR:I = 0x6

.field public static final LOG:I = 0x2

.field public static final MINIMUM_LEVEL_FOR_UI:I = 0x5

.field public static final TRACE:I = 0x3

.field public static final WARN:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 2

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "(ADVICE)"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ReactNative"

    invoke-static {v0, p0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static e(Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/facebook/react/bridge/ReactContext;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x6

    .line 78
    invoke-static {p0, p1, v0}, Lcom/facebook/react/util/RNLog;->logInternal(Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;I)V

    const-string p0, "ReactNative"

    .line 79
    invoke-static {p0, p1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 1

    const-string v0, "ReactNative"

    .line 89
    invoke-static {v0, p0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static l(Ljava/lang/String;)V
    .locals 1

    const-string v0, "ReactNative"

    .line 38
    invoke-static {v0, p0}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static levelToString(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_0

    const-string p0, "none"

    return-object p0

    :cond_0
    const-string p0, "error"

    return-object p0

    :cond_1
    const-string/jumbo p0, "warn"

    return-object p0

    :cond_2
    const-string p0, "log"

    return-object p0
.end method

.method private static logInternal(Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;I)V
    .locals 1
    .param p0    # Lcom/facebook/react/bridge/ReactContext;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x5

    if-lt p2, v0, :cond_0

    if-eqz p0, :cond_0

    .line 95
    invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContext;->hasActiveReactInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 96
    const-class v0, Lcom/facebook/react/util/RCTLog;

    invoke-virtual {p0, v0}, Lcom/facebook/react/bridge/ReactContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object p0

    check-cast p0, Lcom/facebook/react/util/RCTLog;

    invoke-static {p2}, Lcom/facebook/react/util/RNLog;->levelToString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p2, p1}, Lcom/facebook/react/util/RCTLog;->logIfNoNativeHook(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static t(Ljava/lang/String;)V
    .locals 1

    const-string v0, "ReactNative"

    .line 47
    invoke-static {v0, p0}, Lcom/facebook/common/logging/FLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static w(Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/facebook/react/bridge/ReactContext;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x5

    .line 67
    invoke-static {p0, p1, v0}, Lcom/facebook/react/util/RNLog;->logInternal(Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;I)V

    const-string p0, "ReactNative"

    .line 68
    invoke-static {p0, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
