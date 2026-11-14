.class final Lio/grpc/internal/ManagedChannelServiceConfig;
.super Ljava/lang/Object;
.source "ManagedChannelServiceConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/ManagedChannelServiceConfig$ServiceConfigConvertedSelector;,
        Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;
    }
.end annotation


# instance fields
.field private final defaultMethodConfig:Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final healthCheckingConfig:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final loadBalancingConfig:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final retryThrottling:Lio/grpc/internal/RetriableStream$Throttle;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final serviceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final serviceMethodMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;Ljava/util/Map;Ljava/util/Map;Lio/grpc/internal/RetriableStream$Throttle;Ljava/lang/Object;Ljava/util/Map;)V
    .locals 0
    .param p1    # Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lio/grpc/internal/RetriableStream$Throttle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;",
            ">;",
            "Lio/grpc/internal/RetriableStream$Throttle;",
            "Ljava/lang/Object;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->defaultMethodConfig:Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    .line 64
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMethodMap:Ljava/util/Map;

    .line 65
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMap:Ljava/util/Map;

    iput-object p4, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->retryThrottling:Lio/grpc/internal/RetriableStream$Throttle;

    iput-object p5, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->loadBalancingConfig:Ljava/lang/Object;

    if-eqz p6, :cond_0

    .line 70
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, p6}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->healthCheckingConfig:Ljava/util/Map;

    return-void
.end method

.method static empty()Lio/grpc/internal/ManagedChannelServiceConfig;
    .locals 8

    .line 76
    new-instance v7, Lio/grpc/internal/ManagedChannelServiceConfig;

    const/4 v1, 0x0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lio/grpc/internal/ManagedChannelServiceConfig;-><init>(Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;Ljava/util/Map;Ljava/util/Map;Lio/grpc/internal/RetriableStream$Throttle;Ljava/lang/Object;Ljava/util/Map;)V

    return-object v7
.end method

.method static fromServiceConfig(Ljava/util/Map;ZIILjava/lang/Object;)Lio/grpc/internal/ManagedChannelServiceConfig;
    .locals 16
    .param p4    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;ZII",
            "Ljava/lang/Object;",
            ")",
            "Lio/grpc/internal/ManagedChannelServiceConfig;"
        }
    .end annotation

    move/from16 v0, p1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 97
    invoke-static/range {p0 .. p0}, Lio/grpc/internal/ServiceConfigUtil;->getThrottlePolicy(Ljava/util/Map;)Lio/grpc/internal/RetriableStream$Throttle;

    move-result-object v2

    move-object v7, v2

    goto :goto_0

    :cond_0
    move-object v7, v1

    .line 99
    :goto_0
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 100
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 102
    invoke-static/range {p0 .. p0}, Lio/grpc/internal/ServiceConfigUtil;->getHealthCheckedService(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v9

    .line 107
    invoke-static/range {p0 .. p0}, Lio/grpc/internal/ServiceConfigUtil;->getMethodConfigFromServiceConfig(Ljava/util/Map;)Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_1

    .line 111
    new-instance v0, Lio/grpc/internal/ManagedChannelServiceConfig;

    const/4 v4, 0x0

    move-object v3, v0

    move-object/from16 v8, p4

    invoke-direct/range {v3 .. v9}, Lio/grpc/internal/ManagedChannelServiceConfig;-><init>(Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;Ljava/util/Map;Ljava/util/Map;Lio/grpc/internal/RetriableStream$Throttle;Ljava/lang/Object;Ljava/util/Map;)V

    return-object v0

    .line 122
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v4, v1

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 123
    new-instance v3, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    move/from16 v8, p2

    move/from16 v10, p3

    invoke-direct {v3, v1, v0, v8, v10}, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;-><init>(Ljava/util/Map;ZII)V

    .line 127
    invoke-static {v1}, Lio/grpc/internal/ServiceConfigUtil;->getNameListFromMethodConfig(Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 129
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_2

    goto :goto_4

    .line 132
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map;

    .line 133
    invoke-static {v11}, Lio/grpc/internal/ServiceConfigUtil;->getServiceFromName(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v12

    .line 134
    invoke-static {v11}, Lio/grpc/internal/ServiceConfigUtil;->getMethodFromName(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v11

    .line 135
    invoke-static {v12}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v13

    const/4 v14, 0x1

    if-eqz v13, :cond_4

    .line 137
    invoke-static {v11}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v12

    const-string v13, "missing service name for method %s"

    .line 136
    invoke-static {v12, v13, v11}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    if-nez v4, :cond_3

    goto :goto_3

    :cond_3
    const/4 v14, 0x0

    :goto_3
    const-string v4, "Duplicate default method config in service config %s"

    move-object/from16 v13, p0

    .line 138
    invoke-static {v14, v4, v13}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    move-object v4, v3

    goto :goto_2

    :cond_4
    move-object/from16 v13, p0

    .line 143
    invoke-static {v11}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 146
    invoke-interface {v6, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    xor-int/2addr v11, v14

    const-string v14, "Duplicate service %s"

    .line 145
    invoke-static {v11, v14, v12}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 147
    invoke-interface {v6, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 150
    :cond_5
    invoke-static {v12, v11}, Lio/grpc/MethodDescriptor;->generateFullMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 152
    invoke-interface {v5, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    xor-int/2addr v12, v14

    const-string v14, "Duplicate method name %s"

    .line 151
    invoke-static {v12, v14, v11}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 155
    invoke-interface {v5, v11, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_6
    :goto_4
    move-object/from16 v13, p0

    goto/16 :goto_1

    .line 160
    :cond_7
    new-instance v0, Lio/grpc/internal/ManagedChannelServiceConfig;

    move-object v3, v0

    move-object/from16 v8, p4

    invoke-direct/range {v3 .. v9}, Lio/grpc/internal/ManagedChannelServiceConfig;-><init>(Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;Ljava/util/Map;Ljava/util/Map;Lio/grpc/internal/RetriableStream$Throttle;Ljava/lang/Object;Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 217
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 220
    :cond_1
    check-cast p1, Lio/grpc/internal/ManagedChannelServiceConfig;

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->defaultMethodConfig:Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    .line 221
    iget-object v3, p1, Lio/grpc/internal/ManagedChannelServiceConfig;->defaultMethodConfig:Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMethodMap:Ljava/util/Map;

    iget-object v3, p1, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMethodMap:Ljava/util/Map;

    .line 222
    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMap:Ljava/util/Map;

    iget-object v3, p1, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMap:Ljava/util/Map;

    .line 223
    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->retryThrottling:Lio/grpc/internal/RetriableStream$Throttle;

    iget-object v3, p1, Lio/grpc/internal/ManagedChannelServiceConfig;->retryThrottling:Lio/grpc/internal/RetriableStream$Throttle;

    .line 224
    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->loadBalancingConfig:Ljava/lang/Object;

    iget-object p1, p1, Lio/grpc/internal/ManagedChannelServiceConfig;->loadBalancingConfig:Ljava/lang/Object;

    .line 225
    invoke-static {v2, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method getDefaultConfigSelector()Lio/grpc/InternalConfigSelector;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMap:Ljava/util/Map;

    .line 182
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMethodMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->defaultMethodConfig:Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    if-nez v0, :cond_0

    return-object v1

    .line 185
    :cond_0
    new-instance v0, Lio/grpc/internal/ManagedChannelServiceConfig$ServiceConfigConvertedSelector;

    invoke-direct {v0, p0, v1}, Lio/grpc/internal/ManagedChannelServiceConfig$ServiceConfigConvertedSelector;-><init>(Lio/grpc/internal/ManagedChannelServiceConfig;Lio/grpc/internal/ManagedChannelServiceConfig$1;)V

    return-object v0
.end method

.method getHealthCheckingConfig()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->healthCheckingConfig:Ljava/util/Map;

    return-object v0
.end method

.method getLoadBalancingConfig()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->loadBalancingConfig:Ljava/lang/Object;

    return-object v0
.end method

.method getMethodConfig(Lio/grpc/MethodDescriptor;)Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/MethodDescriptor<",
            "**>;)",
            "Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMethodMap:Ljava/util/Map;

    .line 201
    invoke-virtual {p1}, Lio/grpc/MethodDescriptor;->getFullMethodName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    if-nez v0, :cond_0

    .line 203
    invoke-virtual {p1}, Lio/grpc/MethodDescriptor;->getServiceName()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMap:Ljava/util/Map;

    .line 204
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    :cond_0
    if-nez v0, :cond_1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->defaultMethodConfig:Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    :cond_1
    return-object v0
.end method

.method getRetryThrottling()Lio/grpc/internal/RetriableStream$Throttle;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->retryThrottling:Lio/grpc/internal/RetriableStream$Throttle;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->defaultMethodConfig:Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMethodMap:Ljava/util/Map;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMap:Ljava/util/Map;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->retryThrottling:Lio/grpc/internal/RetriableStream$Throttle;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->loadBalancingConfig:Ljava/lang/Object;

    aput-object v2, v0, v1

    .line 230
    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 236
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "defaultMethodConfig"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->defaultMethodConfig:Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    .line 237
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "serviceMethodMap"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMethodMap:Ljava/util/Map;

    .line 238
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "serviceMap"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->serviceMap:Ljava/util/Map;

    .line 239
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "retryThrottling"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->retryThrottling:Lio/grpc/internal/RetriableStream$Throttle;

    .line 240
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "loadBalancingConfig"

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelServiceConfig;->loadBalancingConfig:Ljava/lang/Object;

    .line 241
    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 242
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
