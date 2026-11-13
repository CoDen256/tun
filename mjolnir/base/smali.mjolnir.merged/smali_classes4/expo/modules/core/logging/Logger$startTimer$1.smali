.class public final Lexpo/modules/core/logging/Logger$startTimer$1;
.super Ljava/lang/Object;
.source "Logger.kt"

# interfaces
.implements Lexpo/modules/core/logging/LoggerTimer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/core/logging/Logger;->startTimer(Lkotlin/jvm/functions/Function1;)Lexpo/modules/core/logging/LoggerTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "expo/modules/core/logging/Logger$startTimer$1",
        "Lexpo/modules/core/logging/LoggerTimer;",
        "stop",
        "",
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
.field final synthetic $logFormatter:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $start:J

.field final synthetic this$0:Lexpo/modules/core/logging/Logger;


# direct methods
.method constructor <init>(Lexpo/modules/core/logging/Logger;Lkotlin/jvm/functions/Function1;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/core/logging/Logger;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/core/logging/Logger$startTimer$1;->this$0:Lexpo/modules/core/logging/Logger;

    iput-object p2, p0, Lexpo/modules/core/logging/Logger$startTimer$1;->$logFormatter:Lkotlin/jvm/functions/Function1;

    iput-wide p3, p0, Lexpo/modules/core/logging/Logger$startTimer$1;->$start:J

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public stop()V
    .locals 8

    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lexpo/modules/core/logging/Logger$startTimer$1;->this$0:Lexpo/modules/core/logging/Logger;

    .line 79
    sget-object v3, Lexpo/modules/core/logging/LogType;->Timer:Lexpo/modules/core/logging/LogType;

    iget-object v4, p0, Lexpo/modules/core/logging/Logger$startTimer$1;->$logFormatter:Lkotlin/jvm/functions/Function1;

    iget-wide v5, p0, Lexpo/modules/core/logging/Logger$startTimer$1;->$start:J

    sub-long/2addr v0, v5

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v4, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lexpo/modules/core/logging/Logger;->log$default(Lexpo/modules/core/logging/Logger;Lexpo/modules/core/logging/LogType;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    return-void
.end method
