.class public Lcom/facebook/react/bridge/ReactCxxErrorHandler;
.super Ljava/lang/Object;
.source "ReactCxxErrorHandler.java"


# static fields
.field private static mHandleErrorFunc:Ljava/lang/reflect/Method;

.field private static mObject:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static handleError(Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/facebook/react/bridge/ReactCxxErrorHandler;->mHandleErrorFunc:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :try_start_0
    new-array v0, v0, [Ljava/lang/Object;

    .line 32
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    aput-object v1, v0, p0

    sget-object p0, Lcom/facebook/react/bridge/ReactCxxErrorHandler;->mHandleErrorFunc:Ljava/lang/reflect/Method;

    sget-object v1, Lcom/facebook/react/bridge/ReactCxxErrorHandler;->mObject:Ljava/lang/Object;

    .line 33
    invoke-virtual {p0, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "ReactCxxErrorHandler"

    const-string v1, "Failed to invoke error handler function"

    .line 35
    invoke-static {v0, v1, p0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public static setHandleErrorFunc(Ljava/lang/Object;Ljava/lang/reflect/Method;)V
    .locals 0

    sput-object p0, Lcom/facebook/react/bridge/ReactCxxErrorHandler;->mObject:Ljava/lang/Object;

    sput-object p1, Lcom/facebook/react/bridge/ReactCxxErrorHandler;->mHandleErrorFunc:Ljava/lang/reflect/Method;

    return-void
.end method
