.class public final Lexpo/modules/core/logging/Logger;
.super Ljava/lang/Object;
.source "Logger.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLogger.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Logger.kt\nexpo/modules/core/logging/Logger\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,92:1\n1855#2,2:93\n*S KotlinDebug\n*F\n+ 1 Logger.kt\nexpo/modules/core/logging/Logger\n*L\n86#1:93,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0013\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0002\u0010\u0005J\u000e\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u001a\u0010\u000c\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000eJ\u001a\u0010\u000f\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000eJ\u000e\u0010\u0010\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ$\u0010\u0011\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\n\u001a\u00020\u000b2\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0002J)\u0010\u0014\u001a\u00020\u00152!\u0010\u0016\u001a\u001d\u0012\u0013\u0012\u00110\u0018\u00a2\u0006\u000c\u0008\u0019\u0012\u0008\u0008\u001a\u0012\u0004\u0008\u0008(\u001b\u0012\u0004\u0012\u00020\u000b0\u0017J\u000e\u0010\u001c\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u001a\u0010\u001d\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000eR\u0014\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001e"
    }
    d2 = {
        "Lexpo/modules/core/logging/Logger;",
        "",
        "logHandlers",
        "",
        "Lexpo/modules/core/logging/LogHandler;",
        "(Ljava/util/List;)V",
        "minOSLevel",
        "",
        "debug",
        "",
        "message",
        "",
        "error",
        "cause",
        "",
        "fatal",
        "info",
        "log",
        "type",
        "Lexpo/modules/core/logging/LogType;",
        "startTimer",
        "Lexpo/modules/core/logging/LoggerTimer;",
        "logFormatter",
        "Lkotlin/Function1;",
        "",
        "Lkotlin/ParameterName;",
        "name",
        "duration",
        "trace",
        "warn",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final logHandlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lexpo/modules/core/logging/LogHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final minOSLevel:I


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lexpo/modules/core/logging/LogHandler;",
            ">;)V"
        }
    .end annotation

    const-string v0, "logHandlers"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/core/logging/Logger;->logHandlers:Ljava/util/List;

    const/4 p1, 0x4

    iput p1, p0, Lexpo/modules/core/logging/Logger;->minOSLevel:I

    return-void
.end method

.method public static synthetic error$default(Lexpo/modules/core/logging/Logger;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 59
    :cond_0
    invoke-virtual {p0, p1, p2}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic fatal$default(Lexpo/modules/core/logging/Logger;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 66
    :cond_0
    invoke-virtual {p0, p1, p2}, Lexpo/modules/core/logging/Logger;->fatal(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private final log(Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 85
    sget-object v0, Lexpo/modules/core/logging/LogType;->Companion:Lexpo/modules/core/logging/LogType$Companion;

    invoke-virtual {v0, p1}, Lexpo/modules/core/logging/LogType$Companion;->toOSLogType(Lexpo/modules/core/logging/LogType;)I

    move-result v0

    iget v1, p0, Lexpo/modules/core/logging/Logger;->minOSLevel:I

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lexpo/modules/core/logging/Logger;->logHandlers:Ljava/util/List;

    .line 86
    check-cast v0, Ljava/lang/Iterable;

    .line 93
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/core/logging/LogHandler;

    .line 87
    invoke-virtual {v1, p1, p2, p3}, Lexpo/modules/core/logging/LogHandler;->log$expo_modules_core_release(Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method static synthetic log$default(Lexpo/modules/core/logging/Logger;Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 84
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/core/logging/Logger;->log(Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic warn$default(Lexpo/modules/core/logging/Logger;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 51
    :cond_0
    invoke-virtual {p0, p1, p2}, Lexpo/modules/core/logging/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final debug(Ljava/lang/String;)V
    .locals 7

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    sget-object v2, Lexpo/modules/core/logging/LogType;->Debug:Lexpo/modules/core/logging/LogType;

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-static/range {v1 .. v6}, Lexpo/modules/core/logging/Logger;->log$default(Lexpo/modules/core/logging/Logger;Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    return-void
.end method

.method public final error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    sget-object v0, Lexpo/modules/core/logging/LogType;->Error:Lexpo/modules/core/logging/LogType;

    invoke-direct {p0, v0, p1, p2}, Lexpo/modules/core/logging/Logger;->log(Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final fatal(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    sget-object v0, Lexpo/modules/core/logging/LogType;->Fatal:Lexpo/modules/core/logging/LogType;

    invoke-direct {p0, v0, p1, p2}, Lexpo/modules/core/logging/Logger;->log(Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final info(Ljava/lang/String;)V
    .locals 7

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    sget-object v2, Lexpo/modules/core/logging/LogType;->Info:Lexpo/modules/core/logging/LogType;

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-static/range {v1 .. v6}, Lexpo/modules/core/logging/Logger;->log$default(Lexpo/modules/core/logging/Logger;Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    return-void
.end method

.method public final startTimer(Lkotlin/jvm/functions/Function1;)Lexpo/modules/core/logging/LoggerTimer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;)",
            "Lexpo/modules/core/logging/LoggerTimer;"
        }
    .end annotation

    const-string v0, "logFormatter"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 76
    new-instance v2, Lexpo/modules/core/logging/Logger$startTimer$1;

    invoke-direct {v2, p0, p1, v0, v1}, Lexpo/modules/core/logging/Logger$startTimer$1;-><init>(Lexpo/modules/core/logging/Logger;Lkotlin/jvm/functions/Function1;J)V

    check-cast v2, Lexpo/modules/core/logging/LoggerTimer;

    return-object v2
.end method

.method public final trace(Ljava/lang/String;)V
    .locals 7

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    sget-object v2, Lexpo/modules/core/logging/LogType;->Trace:Lexpo/modules/core/logging/LogType;

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-static/range {v1 .. v6}, Lexpo/modules/core/logging/Logger;->log$default(Lexpo/modules/core/logging/Logger;Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    return-void
.end method

.method public final warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    sget-object v0, Lexpo/modules/core/logging/LogType;->Warn:Lexpo/modules/core/logging/LogType;

    invoke-direct {p0, v0, p1, p2}, Lexpo/modules/core/logging/Logger;->log(Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
