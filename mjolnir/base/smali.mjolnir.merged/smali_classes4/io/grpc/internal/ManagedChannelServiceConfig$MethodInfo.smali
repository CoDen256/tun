.class final Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;
.super Ljava/lang/Object;
.source "ManagedChannelServiceConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/ManagedChannelServiceConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MethodInfo"
.end annotation


# static fields
.field static final KEY:Lio/grpc/CallOptions$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/CallOptions$Key<",
            "Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final hedgingPolicy:Lio/grpc/internal/HedgingPolicy;

.field final maxInboundMessageSize:Ljava/lang/Integer;

.field final maxOutboundMessageSize:Ljava/lang/Integer;

.field final retryPolicy:Lio/grpc/internal/RetryPolicy;

.field final timeoutNanos:Ljava/lang/Long;

.field final waitForReady:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "io.grpc.internal.ManagedChannelServiceConfig.MethodInfo"

    .line 250
    invoke-static {v0}, Lio/grpc/CallOptions$Key;->create(Ljava/lang/String;)Lio/grpc/CallOptions$Key;

    move-result-object v0

    sput-object v0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->KEY:Lio/grpc/CallOptions$Key;

    return-void
.end method

.method constructor <init>(Ljava/util/Map;ZII)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;ZII)V"
        }
    .end annotation

    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 268
    invoke-static {p1}, Lio/grpc/internal/ServiceConfigUtil;->getTimeoutFromMethodConfig(Ljava/util/Map;)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->timeoutNanos:Ljava/lang/Long;

    .line 269
    invoke-static {p1}, Lio/grpc/internal/ServiceConfigUtil;->getWaitForReadyFromMethodConfig(Ljava/util/Map;)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->waitForReady:Ljava/lang/Boolean;

    .line 271
    invoke-static {p1}, Lio/grpc/internal/ServiceConfigUtil;->getMaxResponseMessageBytesFromMethodConfig(Ljava/util/Map;)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxInboundMessageSize:Ljava/lang/Integer;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 274
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ltz v3, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    const-string v4, "maxInboundMessageSize %s exceeds bounds"

    .line 273
    invoke-static {v3, v4, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 278
    :cond_1
    invoke-static {p1}, Lio/grpc/internal/ServiceConfigUtil;->getMaxRequestMessageBytesFromMethodConfig(Ljava/util/Map;)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxOutboundMessageSize:Ljava/lang/Integer;

    if-eqz v0, :cond_3

    .line 281
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ltz v3, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    const-string v2, "maxOutboundMessageSize %s exceeds bounds"

    .line 280
    invoke-static {v1, v2, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    :cond_3
    const/4 v0, 0x0

    if-eqz p2, :cond_4

    .line 286
    invoke-static {p1}, Lio/grpc/internal/ServiceConfigUtil;->getRetryPolicyFromMethodConfig(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    goto :goto_2

    :cond_4
    move-object v1, v0

    :goto_2
    if-nez v1, :cond_5

    move-object p3, v0

    goto :goto_3

    .line 288
    :cond_5
    invoke-static {v1, p3}, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->retryPolicy(Ljava/util/Map;I)Lio/grpc/internal/RetryPolicy;

    move-result-object p3

    :goto_3
    iput-object p3, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->retryPolicy:Lio/grpc/internal/RetryPolicy;

    if-eqz p2, :cond_6

    .line 291
    invoke-static {p1}, Lio/grpc/internal/ServiceConfigUtil;->getHedgingPolicyFromMethodConfig(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    goto :goto_4

    :cond_6
    move-object p1, v0

    :goto_4
    if-nez p1, :cond_7

    goto :goto_5

    .line 293
    :cond_7
    invoke-static {p1, p4}, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->hedgingPolicy(Ljava/util/Map;I)Lio/grpc/internal/HedgingPolicy;

    move-result-object v0

    :goto_5
    iput-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->hedgingPolicy:Lio/grpc/internal/HedgingPolicy;

    return-void
.end method

.method private static hedgingPolicy(Ljava/util/Map;I)Lio/grpc/internal/HedgingPolicy;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;I)",
            "Lio/grpc/internal/HedgingPolicy;"
        }
    .end annotation

    .line 383
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getMaxAttemptsFromHedgingPolicy(Ljava/util/Map;)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "maxAttempts cannot be empty"

    .line 382
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lt v0, v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    const-string v4, "maxAttempts must be greater than 1: %s"

    .line 385
    invoke-static {v1, v4, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 386
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 389
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getHedgingDelayNanosFromHedgingPolicy(Ljava/util/Map;)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "hedgingDelay cannot be empty"

    .line 388
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-ltz v4, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    const-string v3, "hedgingDelay must not be negative: %s"

    .line 391
    invoke-static {v2, v3, v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 394
    new-instance v2, Lio/grpc/internal/HedgingPolicy;

    .line 396
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getNonFatalStatusCodesFromHedgingPolicy(Ljava/util/Map;)Ljava/util/Set;

    move-result-object p0

    invoke-direct {v2, p1, v0, v1, p0}, Lio/grpc/internal/HedgingPolicy;-><init>(IJLjava/util/Set;)V

    return-object v2
.end method

.method private static retryPolicy(Ljava/util/Map;I)Lio/grpc/internal/RetryPolicy;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;I)",
            "Lio/grpc/internal/RetryPolicy;"
        }
    .end annotation

    .line 335
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getMaxAttemptsFromRetryPolicy(Ljava/util/Map;)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "maxAttempts cannot be empty"

    .line 334
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lt v0, v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    const-string v4, "maxAttempts must be greater than 1: %s"

    .line 337
    invoke-static {v1, v4, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    move/from16 v1, p1

    .line 338
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 341
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getInitialBackoffNanosFromRetryPolicy(Ljava/util/Map;)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "initialBackoff cannot be empty"

    .line 340
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/16 v0, 0x0

    cmp-long v4, v6, v0

    if-lez v4, :cond_1

    move v4, v2

    goto :goto_1

    :cond_1
    move v4, v3

    :goto_1
    const-string v8, "initialBackoffNanos must be greater than 0: %s"

    .line 343
    invoke-static {v4, v8, v6, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 349
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getMaxBackoffNanosFromRetryPolicy(Ljava/util/Map;)Ljava/lang/Long;

    move-result-object v4

    const-string v8, "maxBackoff cannot be empty"

    .line 348
    invoke-static {v4, v8}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    cmp-long v4, v8, v0

    if-lez v4, :cond_2

    move v4, v2

    goto :goto_2

    :cond_2
    move v4, v3

    :goto_2
    const-string v10, "maxBackoff must be greater than 0: %s"

    .line 351
    invoke-static {v4, v10, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 355
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getBackoffMultiplierFromRetryPolicy(Ljava/util/Map;)Ljava/lang/Double;

    move-result-object v4

    const-string v10, "backoffMultiplier cannot be empty"

    .line 354
    invoke-static {v4, v10}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmpl-double v4, v10, v12

    if-lez v4, :cond_3

    move v4, v2

    goto :goto_3

    :cond_3
    move v4, v3

    :goto_3
    const-string v12, "backoffMultiplier must be greater than 0: %s"

    .line 360
    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    .line 357
    invoke-static {v4, v12, v13}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 363
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getPerAttemptRecvTimeoutNanosFromRetryPolicy(Ljava/util/Map;)Ljava/lang/Long;

    move-result-object v12

    if-eqz v12, :cond_5

    .line 365
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    cmp-long v0, v13, v0

    if-ltz v0, :cond_4

    goto :goto_4

    :cond_4
    move v0, v3

    goto :goto_5

    :cond_5
    :goto_4
    move v0, v2

    :goto_5
    const-string v1, "perAttemptRecvTimeout cannot be negative: %s"

    .line 364
    invoke-static {v0, v1, v12}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 370
    invoke-static {p0}, Lio/grpc/internal/ServiceConfigUtil;->getRetryableStatusCodesFromRetryPolicy(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v13

    if-nez v12, :cond_7

    .line 372
    invoke-interface {v13}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_6

    :cond_6
    move v2, v3

    :cond_7
    :goto_6
    const-string v0, "retryableStatusCodes cannot be empty without perAttemptRecvTimeout"

    .line 371
    invoke-static {v2, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 375
    new-instance v0, Lio/grpc/internal/RetryPolicy;

    move-object v4, v0

    invoke-direct/range {v4 .. v13}, Lio/grpc/internal/RetryPolicy;-><init>(IJJDLjava/lang/Long;Ljava/util/Set;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 309
    instance-of v0, p1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 312
    :cond_0
    check-cast p1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->timeoutNanos:Ljava/lang/Long;

    .line 313
    iget-object v2, p1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->timeoutNanos:Ljava/lang/Long;

    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->waitForReady:Ljava/lang/Boolean;

    iget-object v2, p1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->waitForReady:Ljava/lang/Boolean;

    .line 314
    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxInboundMessageSize:Ljava/lang/Integer;

    iget-object v2, p1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxInboundMessageSize:Ljava/lang/Integer;

    .line 315
    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxOutboundMessageSize:Ljava/lang/Integer;

    iget-object v2, p1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxOutboundMessageSize:Ljava/lang/Integer;

    .line 316
    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->retryPolicy:Lio/grpc/internal/RetryPolicy;

    iget-object v2, p1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->retryPolicy:Lio/grpc/internal/RetryPolicy;

    .line 317
    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->hedgingPolicy:Lio/grpc/internal/HedgingPolicy;

    iget-object p1, p1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->hedgingPolicy:Lio/grpc/internal/HedgingPolicy;

    .line 318
    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->timeoutNanos:Ljava/lang/Long;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->waitForReady:Ljava/lang/Boolean;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxInboundMessageSize:Ljava/lang/Integer;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxOutboundMessageSize:Ljava/lang/Integer;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->retryPolicy:Lio/grpc/internal/RetryPolicy;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->hedgingPolicy:Lio/grpc/internal/HedgingPolicy;

    aput-object v2, v0, v1

    .line 298
    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 323
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "timeoutNanos"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->timeoutNanos:Ljava/lang/Long;

    .line 324
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "waitForReady"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->waitForReady:Ljava/lang/Boolean;

    .line 325
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "maxInboundMessageSize"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxInboundMessageSize:Ljava/lang/Integer;

    .line 326
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "maxOutboundMessageSize"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->maxOutboundMessageSize:Ljava/lang/Integer;

    .line 327
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "retryPolicy"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->retryPolicy:Lio/grpc/internal/RetryPolicy;

    .line 328
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "hedgingPolicy"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->hedgingPolicy:Lio/grpc/internal/HedgingPolicy;

    .line 329
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 330
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
