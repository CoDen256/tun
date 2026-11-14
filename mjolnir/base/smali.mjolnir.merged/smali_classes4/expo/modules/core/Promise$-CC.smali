.class public final synthetic Lexpo/modules/core/Promise$-CC;
.super Ljava/lang/Object;
.source "Promise.java"


# direct methods
.method public static $default$reject(Lexpo/modules/core/Promise;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "_this"    # Lexpo/modules/core/Promise;

    .line 0
    const/4 v0, 0x0

    .line 25
    invoke-interface {p0, p1, p2, v0}, Lexpo/modules/core/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static $default$reject(Lexpo/modules/core/Promise;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "_this"    # Lexpo/modules/core/Promise;

    .line 29
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, p1, v0, p2}, Lexpo/modules/core/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static $default$reject(Lexpo/modules/core/Promise;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "_this"    # Lexpo/modules/core/Promise;

    .line 16
    instance-of v0, p1, Lexpo/modules/core/interfaces/CodedThrowable;

    if-eqz v0, :cond_0

    .line 17
    move-object v0, p1

    check-cast v0, Lexpo/modules/core/interfaces/CodedThrowable;

    .line 18
    invoke-interface {v0}, Lexpo/modules/core/interfaces/CodedThrowable;->getCode()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lexpo/modules/core/interfaces/CodedThrowable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v1, v0, p1}, Lexpo/modules/core/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    const-string v0, "E_UNKNOWN_ERROR"

    .line 20
    invoke-interface {p0, v0, p1}, Lexpo/modules/core/Promise;->reject(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
