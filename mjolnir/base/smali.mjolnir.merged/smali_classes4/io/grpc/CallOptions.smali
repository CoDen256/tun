.class public final Lio/grpc/CallOptions;
.super Ljava/lang/Object;
.source "CallOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/CallOptions$Key;
    }
.end annotation

.annotation runtime Ljavax/annotation/CheckReturnValue;
.end annotation


# static fields
.field public static final DEFAULT:Lio/grpc/CallOptions;


# instance fields
.field private authority:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private compressorName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private credentials:Lio/grpc/CallCredentials;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private customOptions:[[Ljava/lang/Object;

.field private deadline:Lio/grpc/Deadline;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private maxInboundMessageSize:Ljava/lang/Integer;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private maxOutboundMessageSize:Ljava/lang/Integer;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private streamTracerFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/grpc/ClientStreamTracer$Factory;",
            ">;"
        }
    .end annotation
.end field

.field private waitForReady:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0}, Lio/grpc/CallOptions;-><init>()V

    sput-object v0, Lio/grpc/CallOptions;->DEFAULT:Lio/grpc/CallOptions;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 371
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    const/4 v0, 0x0

    const/4 v1, 0x2

    filled-new-array {v0, v1}, [I

    move-result-object v0

    .line 372
    const-class v1, Ljava/lang/Object;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/Object;

    iput-object v0, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Lio/grpc/CallOptions;)V
    .locals 1

    .line 432
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    .line 433
    iget-object v0, p1, Lio/grpc/CallOptions;->deadline:Lio/grpc/Deadline;

    iput-object v0, p0, Lio/grpc/CallOptions;->deadline:Lio/grpc/Deadline;

    .line 434
    iget-object v0, p1, Lio/grpc/CallOptions;->authority:Ljava/lang/String;

    iput-object v0, p0, Lio/grpc/CallOptions;->authority:Ljava/lang/String;

    .line 435
    iget-object v0, p1, Lio/grpc/CallOptions;->credentials:Lio/grpc/CallCredentials;

    iput-object v0, p0, Lio/grpc/CallOptions;->credentials:Lio/grpc/CallCredentials;

    .line 436
    iget-object v0, p1, Lio/grpc/CallOptions;->executor:Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lio/grpc/CallOptions;->executor:Ljava/util/concurrent/Executor;

    .line 437
    iget-object v0, p1, Lio/grpc/CallOptions;->compressorName:Ljava/lang/String;

    iput-object v0, p0, Lio/grpc/CallOptions;->compressorName:Ljava/lang/String;

    .line 438
    iget-object v0, p1, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    iput-object v0, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    .line 439
    iget-object v0, p1, Lio/grpc/CallOptions;->waitForReady:Ljava/lang/Boolean;

    iput-object v0, p0, Lio/grpc/CallOptions;->waitForReady:Ljava/lang/Boolean;

    .line 440
    iget-object v0, p1, Lio/grpc/CallOptions;->maxInboundMessageSize:Ljava/lang/Integer;

    iput-object v0, p0, Lio/grpc/CallOptions;->maxInboundMessageSize:Ljava/lang/Integer;

    .line 441
    iget-object v0, p1, Lio/grpc/CallOptions;->maxOutboundMessageSize:Ljava/lang/Integer;

    iput-object v0, p0, Lio/grpc/CallOptions;->maxOutboundMessageSize:Ljava/lang/Integer;

    .line 442
    iget-object p1, p1, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    iput-object p1, p0, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getAuthority()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/CallOptions;->authority:Ljava/lang/String;

    return-object v0
.end method

.method public getCompressor()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/CallOptions;->compressorName:Ljava/lang/String;

    return-object v0
.end method

.method public getCredentials()Lio/grpc/CallCredentials;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/CallOptions;->credentials:Lio/grpc/CallCredentials;

    return-object v0
.end method

.method public getDeadline()Lio/grpc/Deadline;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/CallOptions;->deadline:Lio/grpc/Deadline;

    return-object v0
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/CallOptions;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getMaxInboundMessageSize()Ljava/lang/Integer;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/CallOptions;->maxInboundMessageSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMaxOutboundMessageSize()Ljava/lang/Integer;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/CallOptions;->maxOutboundMessageSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public getOption(Lio/grpc/CallOptions$Key;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/CallOptions$Key<",
            "TT;>;)TT;"
        }
    .end annotation

    const-string v0, "key"

    .line 352
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    .line 353
    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 354
    aget-object v2, v2, v1

    aget-object v2, v2, v0

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object p1, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    .line 355
    aget-object p1, p1, v1

    const/4 v0, 0x1

    aget-object p1, p1, v0

    return-object p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 358
    :cond_1
    invoke-static {p1}, Lio/grpc/CallOptions$Key;->access$000(Lio/grpc/CallOptions$Key;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getStreamTracerFactories()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/grpc/ClientStreamTracer$Factory;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    return-object v0
.end method

.method getWaitForReady()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lio/grpc/CallOptions;->waitForReady:Ljava/lang/Boolean;

    return-object v0
.end method

.method public isWaitForReady()Z
    .locals 2

    .line 381
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Lio/grpc/CallOptions;->waitForReady:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 447
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "deadline"

    iget-object v2, p0, Lio/grpc/CallOptions;->deadline:Lio/grpc/Deadline;

    .line 448
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "authority"

    iget-object v2, p0, Lio/grpc/CallOptions;->authority:Ljava/lang/String;

    .line 449
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "callCredentials"

    iget-object v2, p0, Lio/grpc/CallOptions;->credentials:Lio/grpc/CallCredentials;

    .line 450
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/CallOptions;->executor:Ljava/util/concurrent/Executor;

    if-eqz v1, :cond_0

    .line 451
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "executor"

    invoke-virtual {v0, v2, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "compressorName"

    iget-object v2, p0, Lio/grpc/CallOptions;->compressorName:Ljava/lang/String;

    .line 452
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    .line 453
    invoke-static {v1}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "customOptions"

    invoke-virtual {v0, v2, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "waitForReady"

    .line 454
    invoke-virtual {p0}, Lio/grpc/CallOptions;->isWaitForReady()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Z)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "maxInboundMessageSize"

    iget-object v2, p0, Lio/grpc/CallOptions;->maxInboundMessageSize:Ljava/lang/Integer;

    .line 455
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "maxOutboundMessageSize"

    iget-object v2, p0, Lio/grpc/CallOptions;->maxOutboundMessageSize:Ljava/lang/Integer;

    .line 456
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "streamTracerFactories"

    iget-object v2, p0, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    .line 457
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 458
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withAuthority(Ljava/lang/String;)Lio/grpc/CallOptions;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 92
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    iput-object p1, v0, Lio/grpc/CallOptions;->authority:Ljava/lang/String;

    return-object v0
.end method

.method public withCallCredentials(Lio/grpc/CallCredentials;)Lio/grpc/CallOptions;
    .locals 1
    .param p1    # Lio/grpc/CallCredentials;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 101
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    iput-object p1, v0, Lio/grpc/CallOptions;->credentials:Lio/grpc/CallCredentials;

    return-object v0
.end method

.method public withCompression(Ljava/lang/String;)Lio/grpc/CallOptions;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 116
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    iput-object p1, v0, Lio/grpc/CallOptions;->compressorName:Ljava/lang/String;

    return-object v0
.end method

.method public withDeadline(Lio/grpc/Deadline;)Lio/grpc/CallOptions;
    .locals 1
    .param p1    # Lio/grpc/Deadline;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 130
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    iput-object p1, v0, Lio/grpc/CallOptions;->deadline:Lio/grpc/Deadline;

    return-object v0
.end method

.method public withDeadlineAfter(JLjava/util/concurrent/TimeUnit;)Lio/grpc/CallOptions;
    .locals 0

    .line 140
    invoke-static {p1, p2, p3}, Lio/grpc/Deadline;->after(JLjava/util/concurrent/TimeUnit;)Lio/grpc/Deadline;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/grpc/CallOptions;->withDeadline(Lio/grpc/Deadline;)Lio/grpc/CallOptions;

    move-result-object p1

    return-object p1
.end method

.method public withExecutor(Ljava/util/concurrent/Executor;)Lio/grpc/CallOptions;
    .locals 1
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 211
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    iput-object p1, v0, Lio/grpc/CallOptions;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public withMaxInboundMessageSize(I)Lio/grpc/CallOptions;
    .locals 2

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "invalid maxsize %s"

    .line 394
    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 395
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    .line 396
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, v0, Lio/grpc/CallOptions;->maxInboundMessageSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public withMaxOutboundMessageSize(I)Lio/grpc/CallOptions;
    .locals 2

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "invalid maxsize %s"

    .line 405
    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 406
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    .line 407
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, v0, Lio/grpc/CallOptions;->maxOutboundMessageSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public withOption(Lio/grpc/CallOptions$Key;Ljava/lang/Object;)Lio/grpc/CallOptions;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/CallOptions$Key<",
            "TT;>;TT;)",
            "Lio/grpc/CallOptions;"
        }
    .end annotation

    const-string v0, "key"

    .line 319
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "value"

    .line 320
    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v3, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    .line 324
    array-length v4, v3

    const/4 v5, -0x1

    if-ge v2, v4, :cond_1

    .line 325
    aget-object v3, v3, v2

    aget-object v3, v3, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    move v2, v5

    :goto_1
    iget-object v3, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    .line 331
    array-length v3, v3

    const/4 v4, 0x1

    if-ne v2, v5, :cond_2

    move v6, v4

    goto :goto_2

    :cond_2
    move v6, v1

    :goto_2
    add-int/2addr v3, v6

    const/4 v6, 0x2

    filled-new-array {v3, v6}, [I

    move-result-object v3

    const-class v7, Ljava/lang/Object;

    invoke-static {v7, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[Ljava/lang/Object;

    iput-object v3, v0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    iget-object v7, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    .line 332
    array-length v8, v7

    invoke-static {v7, v1, v3, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    if-ne v2, v5, :cond_3

    iget-object v2, v0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    iget-object v3, p0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    .line 336
    array-length v3, v3

    new-array v5, v6, [Ljava/lang/Object;

    aput-object p1, v5, v1

    aput-object p2, v5, v4

    aput-object v5, v2, v3

    goto :goto_3

    :cond_3
    iget-object v3, v0, Lio/grpc/CallOptions;->customOptions:[[Ljava/lang/Object;

    new-array v5, v6, [Ljava/lang/Object;

    aput-object p1, v5, v1

    aput-object p2, v5, v4

    .line 339
    aput-object v5, v3, v2

    :goto_3
    return-object v0
.end method

.method public withStreamTracerFactory(Lio/grpc/ClientStreamTracer$Factory;)Lio/grpc/CallOptions;
    .locals 3

    .line 224
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    .line 225
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    .line 226
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v2, p0, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    .line 227
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 228
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, v0, Lio/grpc/CallOptions;->streamTracerFactories:Ljava/util/List;

    return-object v0
.end method

.method public withWaitForReady()Lio/grpc/CallOptions;
    .locals 2

    .line 159
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    .line 160
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v1, v0, Lio/grpc/CallOptions;->waitForReady:Ljava/lang/Boolean;

    return-object v0
.end method

.method public withoutWaitForReady()Lio/grpc/CallOptions;
    .locals 2

    .line 169
    new-instance v0, Lio/grpc/CallOptions;

    invoke-direct {v0, p0}, Lio/grpc/CallOptions;-><init>(Lio/grpc/CallOptions;)V

    .line 170
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, v0, Lio/grpc/CallOptions;->waitForReady:Ljava/lang/Boolean;

    return-object v0
.end method
