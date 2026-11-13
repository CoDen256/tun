.class final Lio/grpc/internal/DnsNameResolver$Resolve;
.super Ljava/lang/Object;
.source "DnsNameResolver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/DnsNameResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Resolve"
.end annotation


# instance fields
.field private final savedListener:Lio/grpc/NameResolver$Listener2;

.field final synthetic this$0:Lio/grpc/internal/DnsNameResolver;


# direct methods
.method constructor <init>(Lio/grpc/internal/DnsNameResolver;Lio/grpc/NameResolver$Listener2;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    .line 299
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "savedListener"

    .line 300
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/NameResolver$Listener2;

    iput-object p1, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->savedListener:Lio/grpc/NameResolver$Listener2;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    const-string v0, "Using proxy address "

    const-string v1, "Unable to resolve host "

    .line 305
    invoke-static {}, Lio/grpc/internal/DnsNameResolver;->access$400()Ljava/util/logging/Logger;

    move-result-object v2

    sget-object v3, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 306
    invoke-static {}, Lio/grpc/internal/DnsNameResolver;->access$400()Ljava/util/logging/Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Attempting DNS resolution of "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver;->access$500(Lio/grpc/internal/DnsNameResolver;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->finer(Ljava/lang/String;)V

    :cond_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_0
    iget-object v5, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    .line 310
    invoke-static {v5}, Lio/grpc/internal/DnsNameResolver;->access$600(Lio/grpc/internal/DnsNameResolver;)Lio/grpc/EquivalentAddressGroup;

    move-result-object v5

    .line 311
    invoke-static {}, Lio/grpc/NameResolver$ResolutionResult;->newBuilder()Lio/grpc/NameResolver$ResolutionResult$Builder;

    move-result-object v6

    if-eqz v5, :cond_2

    .line 313
    invoke-static {}, Lio/grpc/internal/DnsNameResolver;->access$400()Ljava/util/logging/Logger;

    move-result-object v7

    sget-object v8, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual {v7, v8}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 314
    invoke-static {}, Lio/grpc/internal/DnsNameResolver;->access$400()Ljava/util/logging/Logger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/util/logging/Logger;->finer(Ljava/lang/String;)V

    .line 316
    :cond_1
    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v6, v0}, Lio/grpc/NameResolver$ResolutionResult$Builder;->setAddresses(Ljava/util/List;)Lio/grpc/NameResolver$ResolutionResult$Builder;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    .line 318
    invoke-virtual {v0, v3}, Lio/grpc/internal/DnsNameResolver;->doResolve(Z)Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;

    move-result-object v4

    .line 319
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$200(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Lio/grpc/Status;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->savedListener:Lio/grpc/NameResolver$Listener2;

    .line 320
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$200(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Lio/grpc/Status;

    move-result-object v5

    invoke-virtual {v0, v5}, Lio/grpc/NameResolver$Listener2;->onError(Lio/grpc/Status;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_3

    .line 338
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$200(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Lio/grpc/Status;

    move-result-object v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    move v2, v3

    :goto_0
    iget-object v0, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    .line 339
    invoke-static {v0}, Lio/grpc/internal/DnsNameResolver;->access$1000(Lio/grpc/internal/DnsNameResolver;)Lio/grpc/SynchronizationContext;

    move-result-object v0

    new-instance v1, Lio/grpc/internal/DnsNameResolver$Resolve$1;

    invoke-direct {v1, p0, v2}, Lio/grpc/internal/DnsNameResolver$Resolve$1;-><init>(Lio/grpc/internal/DnsNameResolver$Resolve;Z)V

    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    return-void

    .line 323
    :cond_4
    :try_start_1
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$100(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 324
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$100(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v6, v0}, Lio/grpc/NameResolver$ResolutionResult$Builder;->setAddresses(Ljava/util/List;)Lio/grpc/NameResolver$ResolutionResult$Builder;

    .line 326
    :cond_5
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$300(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Lio/grpc/NameResolver$ConfigOrError;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 327
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$300(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Lio/grpc/NameResolver$ConfigOrError;

    move-result-object v0

    invoke-virtual {v6, v0}, Lio/grpc/NameResolver$ResolutionResult$Builder;->setServiceConfig(Lio/grpc/NameResolver$ConfigOrError;)Lio/grpc/NameResolver$ResolutionResult$Builder;

    .line 329
    :cond_6
    iget-object v0, v4, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->attributes:Lio/grpc/Attributes;

    if-eqz v0, :cond_7

    .line 330
    iget-object v0, v4, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->attributes:Lio/grpc/Attributes;

    invoke-virtual {v6, v0}, Lio/grpc/NameResolver$ResolutionResult$Builder;->setAttributes(Lio/grpc/Attributes;)Lio/grpc/NameResolver$ResolutionResult$Builder;

    :cond_7
    :goto_1
    iget-object v0, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->savedListener:Lio/grpc/NameResolver$Listener2;

    .line 333
    invoke-virtual {v6}, Lio/grpc/NameResolver$ResolutionResult$Builder;->build()Lio/grpc/NameResolver$ResolutionResult;

    move-result-object v5

    invoke-virtual {v0, v5}, Lio/grpc/NameResolver$Listener2;->onResult(Lio/grpc/NameResolver$ResolutionResult;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_8

    .line 338
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$200(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Lio/grpc/Status;

    move-result-object v0

    if-nez v0, :cond_8

    goto :goto_2

    :cond_8
    move v2, v3

    :goto_2
    iget-object v0, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    .line 339
    invoke-static {v0}, Lio/grpc/internal/DnsNameResolver;->access$1000(Lio/grpc/internal/DnsNameResolver;)Lio/grpc/SynchronizationContext;

    move-result-object v0

    new-instance v1, Lio/grpc/internal/DnsNameResolver$Resolve$1;

    invoke-direct {v1, p0, v2}, Lio/grpc/internal/DnsNameResolver$Resolve$1;-><init>(Lio/grpc/internal/DnsNameResolver$Resolve;Z)V

    :goto_3
    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    goto :goto_5

    :catchall_0
    move-exception v0

    goto :goto_6

    :catch_0
    move-exception v0

    :try_start_2
    iget-object v5, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->savedListener:Lio/grpc/NameResolver$Listener2;

    .line 335
    sget-object v6, Lio/grpc/Status;->UNAVAILABLE:Lio/grpc/Status;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    .line 336
    invoke-static {v1}, Lio/grpc/internal/DnsNameResolver;->access$500(Lio/grpc/internal/DnsNameResolver;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v1

    invoke-virtual {v1, v0}, Lio/grpc/Status;->withCause(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object v0

    .line 335
    invoke-virtual {v5, v0}, Lio/grpc/NameResolver$Listener2;->onError(Lio/grpc/Status;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v4, :cond_9

    .line 338
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$200(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Lio/grpc/Status;

    move-result-object v0

    if-nez v0, :cond_9

    goto :goto_4

    :cond_9
    move v2, v3

    :goto_4
    iget-object v0, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    .line 339
    invoke-static {v0}, Lio/grpc/internal/DnsNameResolver;->access$1000(Lio/grpc/internal/DnsNameResolver;)Lio/grpc/SynchronizationContext;

    move-result-object v0

    new-instance v1, Lio/grpc/internal/DnsNameResolver$Resolve$1;

    invoke-direct {v1, p0, v2}, Lio/grpc/internal/DnsNameResolver$Resolve$1;-><init>(Lio/grpc/internal/DnsNameResolver$Resolve;Z)V

    goto :goto_3

    :goto_5
    return-void

    :goto_6
    if-eqz v4, :cond_a

    .line 338
    invoke-static {v4}, Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;->access$200(Lio/grpc/internal/DnsNameResolver$InternalResolutionResult;)Lio/grpc/Status;

    move-result-object v1

    if-nez v1, :cond_a

    goto :goto_7

    :cond_a
    move v2, v3

    :goto_7
    iget-object v1, p0, Lio/grpc/internal/DnsNameResolver$Resolve;->this$0:Lio/grpc/internal/DnsNameResolver;

    .line 339
    invoke-static {v1}, Lio/grpc/internal/DnsNameResolver;->access$1000(Lio/grpc/internal/DnsNameResolver;)Lio/grpc/SynchronizationContext;

    move-result-object v1

    new-instance v3, Lio/grpc/internal/DnsNameResolver$Resolve$1;

    invoke-direct {v3, p0, v2}, Lio/grpc/internal/DnsNameResolver$Resolve$1;-><init>(Lio/grpc/internal/DnsNameResolver$Resolve;Z)V

    invoke-virtual {v1, v3}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    .line 351
    throw v0
.end method
