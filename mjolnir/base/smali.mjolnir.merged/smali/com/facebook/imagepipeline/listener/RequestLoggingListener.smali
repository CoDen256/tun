.class public final Lcom/facebook/imagepipeline/listener/RequestLoggingListener;
.super Ljava/lang/Object;
.source "RequestLoggingListener.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/listener/RequestListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010$\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0007\u0018\u0000 $2\u00020\u0001:\u0001$B\u0005\u00a2\u0006\u0002\u0010\u0002J \u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u0006H\u0016J.\u0010\u000e\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u00062\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0010H\u0016J6\u0010\u0011\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00132\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0010H\u0016J.\u0010\u0014\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u00062\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0010H\u0016J\u0018\u0010\u0015\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0006H\u0016J\u0010\u0010\u0016\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0006H\u0016J(\u0010\u0017\u001a\u00020\n2\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u001a\u001a\u00020\u001bH\u0016J(\u0010\u001c\u001a\u00020\n2\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u001bH\u0016J \u0010\u001f\u001a\u00020\n2\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u001bH\u0016J \u0010 \u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u00062\u0006\u0010!\u001a\u00020\u001bH\u0016J\u0010\u0010\"\u001a\u00020\u001b2\u0006\u0010#\u001a\u00020\u0006H\u0016R(\u0010\u0003\u001a\u001a\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0004\u0012\u00020\u00070\u00048\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0008\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u00048\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006%"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/listener/RequestLoggingListener;",
        "Lcom/facebook/imagepipeline/listener/RequestListener;",
        "()V",
        "producerStartTimeMap",
        "",
        "Landroid/util/Pair;",
        "",
        "",
        "requestStartTimeMap",
        "onProducerEvent",
        "",
        "requestId",
        "producerName",
        "producerEventName",
        "onProducerFinishWithCancellation",
        "extraMap",
        "",
        "onProducerFinishWithFailure",
        "throwable",
        "",
        "onProducerFinishWithSuccess",
        "onProducerStart",
        "onRequestCancellation",
        "onRequestFailure",
        "request",
        "Lcom/facebook/imagepipeline/request/ImageRequest;",
        "isPrefetch",
        "",
        "onRequestStart",
        "callerContextObject",
        "",
        "onRequestSuccess",
        "onUltimateProducerReached",
        "successful",
        "requiresExtraMap",
        "id",
        "Companion",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

.field private static final TAG:Ljava/lang/String; = "RequestLoggingListener"


# instance fields
.field private final producerStartTimeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final requestStartTimeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->producerStartTimeMap:Ljava/util/Map;

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->requestStartTimeMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public declared-synchronized onProducerEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    monitor-enter p0

    :try_start_0
    const-string v0, "requestId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerEventName"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    .line 127
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->producerStartTimeMap:Ljava/util/Map;

    .line 129
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    sget-object v2, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 130
    invoke-static {v2}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v3

    const-string v5, "RequestLoggingListener"

    const-string/jumbo v6, "time %d: onProducerEvent: {requestId: %s, stage: %s, eventName: %s; elapsedTime: %d ms}"

    const/4 v7, 0x5

    new-array v7, v7, [Ljava/lang/Object;

    .line 134
    invoke-static {v2}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const/4 v8, 0x1

    aput-object p1, v7, v8

    aput-object p2, v7, v0

    const/4 p1, 0x3

    aput-object p3, v7, p1

    .line 138
    invoke-static {v2, v1, v3, v4}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v7, p2

    .line 131
    invoke-static {v5, v6, v7}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onProducerFinishWithCancellation(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "requestId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    .line 110
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 111
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->producerStartTimeMap:Ljava/util/Map;

    .line 112
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    sget-object v2, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 113
    invoke-static {v2}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v3

    const-string v5, "RequestLoggingListener"

    const-string/jumbo v6, "time %d: onProducerFinishWithCancellation: {requestId: %s, stage: %s, elapsedTime: %d ms, extraMap: %s}"

    const/4 v7, 0x5

    new-array v7, v7, [Ljava/lang/Object;

    .line 117
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const/4 v8, 0x1

    aput-object p1, v7, v8

    aput-object p2, v7, v0

    .line 120
    invoke-static {v2, v1, v3, v4}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v7, p2

    const/4 p1, 0x4

    aput-object p3, v7, p1

    .line 114
    invoke-static {v5, v6, v7}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onProducerFinishWithFailure(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "requestId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "throwable"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x5

    .line 87
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 88
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->producerStartTimeMap:Ljava/util/Map;

    .line 89
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    sget-object v2, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 90
    invoke-static {v2}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v3

    const-string v5, "RequestLoggingListener"

    const-string/jumbo v6, "time %d: onProducerFinishWithFailure: {requestId: %s, stage: %s, elapsedTime: %d ms, extraMap: %s, throwable: %s}"

    const/4 v7, 0x6

    new-array v7, v7, [Ljava/lang/Object;

    .line 95
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const/4 v8, 0x1

    aput-object p1, v7, v8

    const/4 p1, 0x2

    aput-object p2, v7, p1

    .line 98
    invoke-static {v2, v1, v3, v4}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v7, p2

    const/4 p1, 0x4

    aput-object p4, v7, p1

    .line 100
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v7, v0

    .line 91
    invoke-static {v5, p3, v6, v7}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onProducerFinishWithSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "requestId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    .line 65
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->producerStartTimeMap:Ljava/util/Map;

    .line 67
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    sget-object v2, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 68
    invoke-static {v2}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v3

    const-string v5, "RequestLoggingListener"

    const-string/jumbo v6, "time %d: onProducerFinishWithSuccess: {requestId: %s, producer: %s, elapsedTime: %d ms, extraMap: %s}"

    const/4 v7, 0x5

    new-array v7, v7, [Ljava/lang/Object;

    .line 72
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const/4 v8, 0x1

    aput-object p1, v7, v8

    aput-object p2, v7, v0

    .line 75
    invoke-static {v2, v1, v3, v4}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v7, p2

    const/4 p1, 0x4

    aput-object p3, v7, p1

    .line 69
    invoke-static {v5, v6, v7}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onProducerStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    monitor-enter p0

    :try_start_0
    const-string v0, "requestId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    .line 46
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    sget-object v1, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 48
    invoke-static {v1}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-object v4, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->producerStartTimeMap:Ljava/util/Map;

    const-string v5, "mapKey"

    .line 49
    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "RequestLoggingListener"

    const-string/jumbo v3, "time %d: onProducerStart: {requestId: %s, producer: %s}"

    .line 53
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 50
    invoke-static {v0, v3, v1, p1, p2}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onRequestCancellation(Ljava/lang/String;)V
    .locals 7

    monitor-enter p0

    :try_start_0
    const-string v0, "requestId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    .line 199
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->requestStartTimeMap:Ljava/util/Map;

    .line 200
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    sget-object v1, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 201
    invoke-static {v1}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v2

    const-string v4, "RequestLoggingListener"

    const-string/jumbo v5, "time %d: onRequestCancellation: {requestId: %s, elapsedTime: %d ms}"

    .line 205
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 207
    invoke-static {v1, v0, v2, v3}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 202
    invoke-static {v4, v5, v6, p1, v0}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onRequestFailure(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ljava/lang/Throwable;Z)V
    .locals 7

    monitor-enter p0

    :try_start_0
    const-string p4, "request"

    invoke-static {p1, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "requestId"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo p1, "throwable"

    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x5

    .line 184
    invoke-static {p1}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->requestStartTimeMap:Ljava/util/Map;

    .line 185
    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    sget-object p4, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 186
    invoke-static {p4}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v0

    const-string v2, "RequestLoggingListener"

    const-string/jumbo v3, "time %d: onRequestFailure: {requestId: %s, elapsedTime: %d ms, throwable: %s}"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    .line 190
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const/4 v5, 0x1

    aput-object p2, v4, v5

    .line 192
    invoke-static {p4, p1, v0, v1}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v4, p2

    .line 193
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v4, p2

    .line 187
    invoke-static {v2, v3, v4}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onRequestStart(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Ljava/lang/String;Z)V
    .locals 6

    monitor-enter p0

    :try_start_0
    const-string v0, "request"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "callerContextObject"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "requestId"

    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x2

    .line 32
    invoke-static {p1}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string v0, "RequestLoggingListener"

    const-string/jumbo v1, "time %d: onRequestSubmit: {requestId: %s, callerContext: %s, isPrefetch: %b}"

    sget-object p1, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 36
    invoke-static {p1}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 39
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    move-object v3, p3

    move-object v4, p2

    .line 33
    invoke-static/range {v0 .. v5}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->requestStartTimeMap:Ljava/util/Map;

    .line 40
    invoke-static {p1}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {p2, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onRequestSuccess(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Z)V
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string p3, "request"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "requestId"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x2

    .line 165
    invoke-static {p1}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->requestStartTimeMap:Ljava/util/Map;

    .line 166
    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    sget-object p3, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 167
    invoke-static {p3}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v0

    const-string v2, "RequestLoggingListener"

    const-string/jumbo v3, "time %d: onRequestSuccess: {requestId: %s, elapsedTime: %d ms}"

    .line 171
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 173
    invoke-static {p3, p1, v0, v1}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 168
    invoke-static {v2, v3, v4, p2, p1}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onUltimateProducerReached(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 10

    monitor-enter p0

    :try_start_0
    const-string v0, "requestId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    .line 148
    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->producerStartTimeMap:Ljava/util/Map;

    .line 150
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    sget-object v2, Lcom/facebook/imagepipeline/listener/RequestLoggingListener;->Companion:Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;

    .line 151
    invoke-static {v2}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J

    move-result-wide v3

    const-string v5, "RequestLoggingListener"

    const-string/jumbo v6, "time %d: onUltimateProducerReached: {requestId: %s, producer: %s, elapsedTime: %d ms, success: %b}"

    const/4 v7, 0x5

    new-array v7, v7, [Ljava/lang/Object;

    .line 155
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const/4 v8, 0x1

    aput-object p1, v7, v8

    aput-object p2, v7, v0

    .line 158
    invoke-static {v2, v1, v3, v4}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, v7, p2

    .line 159
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const/4 p2, 0x4

    aput-object p1, v7, p2

    .line 152
    invoke-static {v5, v6, v7}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public requiresExtraMap(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x2

    .line 211
    invoke-static {p1}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result p1

    return p1
.end method
