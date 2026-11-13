.class public Lcom/facebook/common/logging/FLog;
.super Ljava/lang/Object;
.source "FLog.java"


# static fields
.field public static final ASSERT:I = 0x7

.field public static final DEBUG:I = 0x3

.field public static final ERROR:I = 0x6

.field public static final INFO:I = 0x4

.field public static final VERBOSE:I = 0x2

.field public static final WARN:I = 0x5

.field private static sHandler:Lcom/facebook/common/logging/LoggingDelegate;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    invoke-static {}, Lcom/facebook/common/logging/FLogDefaultLoggingDelegate;->getInstance()Lcom/facebook/common/logging/FLogDefaultLoggingDelegate;

    move-result-object v0

    sput-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 183
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 184
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 189
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 190
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 195
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 196
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 201
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 202
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    const/4 p2, 0x2

    aput-object p4, v1, p2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 208
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 209
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 p2, 0x1

    aput-object p3, v2, p2

    const/4 p2, 0x2

    aput-object p4, v2, p2

    aput-object p5, v2, v1

    invoke-static {p1, v2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 244
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 245
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs d(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 226
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 227
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs d(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 232
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 233
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 153
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 154
    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 159
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    .line 160
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 165
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    .line 166
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 171
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    const/4 p2, 0x2

    aput-object p4, v1, p2

    .line 172
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 177
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 p2, 0x1

    aput-object p3, v2, p2

    const/4 p2, 0x2

    aput-object p4, v2, p2

    aput-object p5, v2, v1

    .line 178
    invoke-static {p1, v2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 238
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 239
    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 214
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs d(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    .line 220
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 221
    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, p1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 401
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 402
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 437
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 438
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs e(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 419
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 420
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs e(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 425
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 426
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 395
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 396
    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 431
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 432
    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 407
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 408
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs e(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 413
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 414
    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private static varargs formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 491
    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMinimumLoggingLevel()I
    .locals 1

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 52
    invoke-interface {v0}, Lcom/facebook/common/logging/LoggingDelegate;->getMinimumLoggingLevel()I

    move-result v0

    return v0
.end method

.method private static getTag(Ljava/lang/Class;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 495
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static i(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 280
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 281
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 286
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 287
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 292
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 293
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 298
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 299
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    const/4 p2, 0x2

    aput-object p4, v1, p2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 305
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 306
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    const/4 p2, 0x2

    aput-object p4, v1, p2

    const/4 p2, 0x3

    aput-object p5, v1, p2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 341
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 342
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs i(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 323
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 324
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs i(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x4

    .line 329
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 330
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 250
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 251
    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 256
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    .line 257
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 262
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    .line 263
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 268
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    const/4 p2, 0x2

    aput-object p4, v1, p2

    .line 269
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 274
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    const/4 p2, 0x2

    aput-object p4, v1, p2

    const/4 p2, 0x3

    aput-object p5, v1, p2

    .line 275
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 335
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 336
    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 311
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 312
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs i(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x4

    .line 317
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 318
    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static isLoggable(I)Z
    .locals 1

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 44
    invoke-interface {v0, p0}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result p0

    return p0
.end method

.method public static setLoggingDelegate(Lcom/facebook/common/logging/LoggingDelegate;)V
    .locals 0

    if-eqz p0, :cond_0

    sput-object p0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    return-void

    .line 38
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method public static setMinimumLoggingLevel(I)V
    .locals 1

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 48
    invoke-interface {v0, p0}, Lcom/facebook/common/logging/LoggingDelegate;->setMinimumLoggingLevel(I)V

    return-void
.end method

.method public static v(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 86
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 87
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 92
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 93
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 98
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 99
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x2

    .line 104
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    aput-object p4, v1, v0

    .line 105
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 111
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 112
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 p2, 0x1

    aput-object p3, v2, p2

    aput-object p4, v2, v1

    const/4 p2, 0x3

    aput-object p5, v2, p2

    invoke-static {p1, v2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 147
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 148
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs v(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 129
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 130
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs v(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 135
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 136
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 56
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 57
    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 62
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    .line 63
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 68
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    .line 69
    invoke-static {p1, v1}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 74
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 p2, 0x1

    aput-object p3, v2, p2

    aput-object p4, v2, v1

    .line 75
    invoke-static {p1, v2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 80
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 p2, 0x1

    aput-object p3, v2, p2

    aput-object p4, v2, v1

    const/4 p2, 0x3

    aput-object p5, v2, p2

    .line 81
    invoke-static {p1, v2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 141
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 142
    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 117
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 118
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs v(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x2

    .line 123
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 124
    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x5

    .line 353
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 354
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x5

    .line 389
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 390
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs w(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x5

    .line 371
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 372
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs w(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x5

    .line 377
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 378
    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x5

    .line 347
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 348
    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x5

    .line 383
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 384
    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x5

    .line 359
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 360
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs w(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x5

    .line 365
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 366
    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static wtf(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 449
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 450
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->wtf(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static wtf(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 485
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 486
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs wtf(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 467
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 468
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->wtf(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs wtf(Ljava/lang/Class;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 473
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 474
    invoke-static {p0}, Lcom/facebook/common/logging/FLog;->getTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static wtf(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 443
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 444
    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->wtf(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 479
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 480
    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/common/logging/LoggingDelegate;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static varargs wtf(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 455
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 456
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/common/logging/LoggingDelegate;->wtf(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs wtf(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    const/4 v1, 0x6

    .line 461
    invoke-interface {v0, v1}, Lcom/facebook/common/logging/LoggingDelegate;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/facebook/common/logging/FLog;->sHandler:Lcom/facebook/common/logging/LoggingDelegate;

    .line 462
    invoke-static {p2, p3}, Lcom/facebook/common/logging/FLog;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p0, p2, p1}, Lcom/facebook/common/logging/LoggingDelegate;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method
