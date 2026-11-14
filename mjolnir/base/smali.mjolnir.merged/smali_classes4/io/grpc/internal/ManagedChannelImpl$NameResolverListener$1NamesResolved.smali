.class final Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;
.super Ljava/lang/Object;
.source "ManagedChannelImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->onResult(Lio/grpc/NameResolver$ResolutionResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "NamesResolved"
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

.field final synthetic val$resolutionResult:Lio/grpc/NameResolver$ResolutionResult;


# direct methods
.method constructor <init>(Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;Lio/grpc/NameResolver$ResolutionResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    iput-object p2, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->val$resolutionResult:Lio/grpc/NameResolver$ResolutionResult;

    .line 1740
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1745
    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v0}, Lio/grpc/internal/ManagedChannelImpl;->access$7000(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/NameResolver;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->resolver:Lio/grpc/NameResolver;

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->val$resolutionResult:Lio/grpc/NameResolver$ResolutionResult;

    .line 1749
    invoke-virtual {v0}, Lio/grpc/NameResolver$ResolutionResult;->getAddresses()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1750
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$3100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/ChannelLogger;

    move-result-object v1

    sget-object v2, Lio/grpc/ChannelLogger$ChannelLogLevel;->DEBUG:Lio/grpc/ChannelLogger$ChannelLogLevel;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    iget-object v5, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->val$resolutionResult:Lio/grpc/NameResolver$ResolutionResult;

    .line 1754
    invoke-virtual {v5}, Lio/grpc/NameResolver$ResolutionResult;->getAttributes()Lio/grpc/Attributes;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v3, v6

    const-string v5, "Resolved address: {0}, config={1}"

    .line 1750
    invoke-virtual {v1, v2, v5, v3}, Lio/grpc/ChannelLogger;->log(Lio/grpc/ChannelLogger$ChannelLogLevel;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1756
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$7100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelImpl$ResolutionState;

    move-result-object v1

    sget-object v2, Lio/grpc/internal/ManagedChannelImpl$ResolutionState;->SUCCESS:Lio/grpc/internal/ManagedChannelImpl$ResolutionState;

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1757
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$3100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/ChannelLogger;

    move-result-object v1

    sget-object v2, Lio/grpc/ChannelLogger$ChannelLogLevel;->INFO:Lio/grpc/ChannelLogger$ChannelLogLevel;

    new-array v3, v6, [Ljava/lang/Object;

    aput-object v0, v3, v4

    const-string v5, "Address resolved: {0}"

    invoke-virtual {v1, v2, v5, v3}, Lio/grpc/ChannelLogger;->log(Lio/grpc/ChannelLogger$ChannelLogLevel;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1758
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    sget-object v2, Lio/grpc/internal/ManagedChannelImpl$ResolutionState;->SUCCESS:Lio/grpc/internal/ManagedChannelImpl$ResolutionState;

    invoke-static {v1, v2}, Lio/grpc/internal/ManagedChannelImpl;->access$7102(Lio/grpc/internal/ManagedChannelImpl;Lio/grpc/internal/ManagedChannelImpl$ResolutionState;)Lio/grpc/internal/ManagedChannelImpl$ResolutionState;

    :cond_1
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1761
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lio/grpc/internal/ManagedChannelImpl;->access$7202(Lio/grpc/internal/ManagedChannelImpl;Lio/grpc/internal/BackoffPolicy;)Lio/grpc/internal/BackoffPolicy;

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->val$resolutionResult:Lio/grpc/NameResolver$ResolutionResult;

    .line 1762
    invoke-virtual {v1}, Lio/grpc/NameResolver$ResolutionResult;->getServiceConfig()Lio/grpc/NameResolver$ConfigOrError;

    move-result-object v1

    iget-object v3, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->val$resolutionResult:Lio/grpc/NameResolver$ResolutionResult;

    .line 1764
    invoke-virtual {v3}, Lio/grpc/NameResolver$ResolutionResult;->getAttributes()Lio/grpc/Attributes;

    move-result-object v3

    sget-object v5, Lio/grpc/InternalConfigSelector;->KEY:Lio/grpc/Attributes$Key;

    invoke-virtual {v3, v5}, Lio/grpc/Attributes;->get(Lio/grpc/Attributes$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/grpc/InternalConfigSelector;

    if-eqz v1, :cond_2

    .line 1766
    invoke-virtual {v1}, Lio/grpc/NameResolver$ConfigOrError;->getConfig()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 1767
    invoke-virtual {v1}, Lio/grpc/NameResolver$ConfigOrError;->getConfig()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/grpc/internal/ManagedChannelServiceConfig;

    goto :goto_0

    :cond_2
    move-object v5, v2

    :goto_0
    if-eqz v1, :cond_3

    .line 1769
    invoke-virtual {v1}, Lio/grpc/NameResolver$ConfigOrError;->getError()Lio/grpc/Status;

    move-result-object v7

    goto :goto_1

    :cond_3
    move-object v7, v2

    :goto_1
    iget-object v8, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1772
    iget-object v8, v8, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v8}, Lio/grpc/internal/ManagedChannelImpl;->access$7300(Lio/grpc/internal/ManagedChannelImpl;)Z

    move-result v8

    if-nez v8, :cond_7

    if-eqz v5, :cond_4

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1774
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$3100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/ChannelLogger;

    move-result-object v1

    sget-object v2, Lio/grpc/ChannelLogger$ChannelLogLevel;->INFO:Lio/grpc/ChannelLogger$ChannelLogLevel;

    const-string v4, "Service config from name resolver discarded by channel settings"

    invoke-virtual {v1, v2, v4}, Lio/grpc/ChannelLogger;->log(Lio/grpc/ChannelLogger$ChannelLogLevel;Ljava/lang/String;)V

    :cond_4
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1779
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$7400(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v1

    if-nez v1, :cond_5

    invoke-static {}, Lio/grpc/internal/ManagedChannelImpl;->access$7500()Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v1

    goto :goto_2

    :cond_5
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$7400(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v1

    :goto_2
    if-eqz v3, :cond_6

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1781
    iget-object v2, v2, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v2}, Lio/grpc/internal/ManagedChannelImpl;->access$3100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/ChannelLogger;

    move-result-object v2

    sget-object v3, Lio/grpc/ChannelLogger$ChannelLogLevel;->INFO:Lio/grpc/ChannelLogger$ChannelLogLevel;

    const-string v4, "Config selector from name resolver discarded by channel settings"

    invoke-virtual {v2, v3, v4}, Lio/grpc/ChannelLogger;->log(Lio/grpc/ChannelLogger$ChannelLogLevel;Ljava/lang/String;)V

    :cond_6
    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1785
    iget-object v2, v2, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v2}, Lio/grpc/internal/ManagedChannelImpl;->access$7600(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    move-result-object v2

    invoke-virtual {v1}, Lio/grpc/internal/ManagedChannelServiceConfig;->getDefaultConfigSelector()Lio/grpc/InternalConfigSelector;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->updateConfigSelector(Lio/grpc/InternalConfigSelector;)V

    goto/16 :goto_6

    :cond_7
    if-eqz v5, :cond_9

    if-eqz v3, :cond_8

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1792
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$7600(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    move-result-object v1

    invoke-virtual {v1, v3}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->updateConfigSelector(Lio/grpc/InternalConfigSelector;)V

    .line 1793
    invoke-virtual {v5}, Lio/grpc/internal/ManagedChannelServiceConfig;->getDefaultConfigSelector()Lio/grpc/InternalConfigSelector;

    move-result-object v1

    if-eqz v1, :cond_d

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1794
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$3100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/ChannelLogger;

    move-result-object v1

    sget-object v2, Lio/grpc/ChannelLogger$ChannelLogLevel;->DEBUG:Lio/grpc/ChannelLogger$ChannelLogLevel;

    const-string v3, "Method configs in service config will be discarded due to presence ofconfig-selector"

    invoke-virtual {v1, v2, v3}, Lio/grpc/ChannelLogger;->log(Lio/grpc/ChannelLogger$ChannelLogLevel;Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_8
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1800
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$7600(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    move-result-object v1

    invoke-virtual {v5}, Lio/grpc/internal/ManagedChannelServiceConfig;->getDefaultConfigSelector()Lio/grpc/InternalConfigSelector;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->updateConfigSelector(Lio/grpc/InternalConfigSelector;)V

    goto :goto_3

    :cond_9
    iget-object v3, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1802
    iget-object v3, v3, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v3}, Lio/grpc/internal/ManagedChannelImpl;->access$7400(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v3

    if-eqz v3, :cond_a

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1803
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$7400(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v5

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1804
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$7600(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    move-result-object v1

    invoke-virtual {v5}, Lio/grpc/internal/ManagedChannelServiceConfig;->getDefaultConfigSelector()Lio/grpc/InternalConfigSelector;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->updateConfigSelector(Lio/grpc/InternalConfigSelector;)V

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1805
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$3100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/ChannelLogger;

    move-result-object v1

    sget-object v2, Lio/grpc/ChannelLogger$ChannelLogLevel;->INFO:Lio/grpc/ChannelLogger$ChannelLogLevel;

    const-string v3, "Received no service config, using default service config"

    invoke-virtual {v1, v2, v3}, Lio/grpc/ChannelLogger;->log(Lio/grpc/ChannelLogger$ChannelLogLevel;Ljava/lang/String;)V

    goto :goto_3

    :cond_a
    if-eqz v7, :cond_c

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1809
    iget-object v2, v2, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v2}, Lio/grpc/internal/ManagedChannelImpl;->access$7700(Lio/grpc/internal/ManagedChannelImpl;)Z

    move-result v2

    if-nez v2, :cond_b

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1811
    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v0}, Lio/grpc/internal/ManagedChannelImpl;->access$3100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/ChannelLogger;

    move-result-object v0

    sget-object v2, Lio/grpc/ChannelLogger$ChannelLogLevel;->INFO:Lio/grpc/ChannelLogger$ChannelLogLevel;

    const-string v3, "Fallback to error due to invalid first service config without default config"

    invoke-virtual {v0, v2, v3}, Lio/grpc/ChannelLogger;->log(Lio/grpc/ChannelLogger$ChannelLogLevel;Ljava/lang/String;)V

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1818
    invoke-virtual {v1}, Lio/grpc/NameResolver$ConfigOrError;->getError()Lio/grpc/Status;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->onError(Lio/grpc/Status;)V

    return-void

    :cond_b
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1821
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$1800(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v5

    goto :goto_3

    .line 1824
    :cond_c
    invoke-static {}, Lio/grpc/internal/ManagedChannelImpl;->access$7500()Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v5

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1825
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$7600(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    move-result-object v1

    invoke-virtual {v1, v2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->updateConfigSelector(Lio/grpc/InternalConfigSelector;)V

    :cond_d
    :goto_3
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1827
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$1800(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v1

    invoke-virtual {v5, v1}, Lio/grpc/internal/ManagedChannelServiceConfig;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1828
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$3100(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/ChannelLogger;

    move-result-object v1

    sget-object v2, Lio/grpc/ChannelLogger$ChannelLogLevel;->INFO:Lio/grpc/ChannelLogger$ChannelLogLevel;

    new-array v3, v6, [Ljava/lang/Object;

    .line 1831
    invoke-static {}, Lio/grpc/internal/ManagedChannelImpl;->access$7500()Lio/grpc/internal/ManagedChannelServiceConfig;

    move-result-object v7

    if-ne v5, v7, :cond_e

    const-string v7, " to empty"

    goto :goto_4

    :cond_e
    const-string v7, ""

    :goto_4
    aput-object v7, v3, v4

    const-string v4, "Service config changed{0}"

    .line 1828
    invoke-virtual {v1, v2, v4, v3}, Lio/grpc/ChannelLogger;->log(Lio/grpc/ChannelLogger$ChannelLogLevel;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1832
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1, v5}, Lio/grpc/internal/ManagedChannelImpl;->access$1802(Lio/grpc/internal/ManagedChannelImpl;Lio/grpc/internal/ManagedChannelServiceConfig;)Lio/grpc/internal/ManagedChannelServiceConfig;

    :cond_f
    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1839
    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v1, v6}, Lio/grpc/internal/ManagedChannelImpl;->access$7702(Lio/grpc/internal/ManagedChannelImpl;Z)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception v1

    .line 1841
    sget-object v2, Lio/grpc/internal/ManagedChannelImpl;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "["

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    iget-object v6, v6, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 1843
    invoke-virtual {v6}, Lio/grpc/internal/ManagedChannelImpl;->getLogId()Lio/grpc/InternalLogId;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, "] Unexpected exception from parsing service config"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1841
    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_5
    move-object v1, v5

    :goto_6
    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->val$resolutionResult:Lio/grpc/NameResolver$ResolutionResult;

    .line 1848
    invoke-virtual {v2}, Lio/grpc/NameResolver$ResolutionResult;->getAttributes()Lio/grpc/Attributes;

    move-result-object v2

    iget-object v3, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1850
    iget-object v3, v3, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->helper:Lio/grpc/internal/ManagedChannelImpl$LbHelperImpl;

    iget-object v4, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    iget-object v4, v4, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v4}, Lio/grpc/internal/ManagedChannelImpl;->access$900(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelImpl$LbHelperImpl;

    move-result-object v4

    if-ne v3, v4, :cond_11

    .line 1852
    invoke-virtual {v2}, Lio/grpc/Attributes;->toBuilder()Lio/grpc/Attributes$Builder;

    move-result-object v2

    sget-object v3, Lio/grpc/InternalConfigSelector;->KEY:Lio/grpc/Attributes$Key;

    invoke-virtual {v2, v3}, Lio/grpc/Attributes$Builder;->discard(Lio/grpc/Attributes$Key;)Lio/grpc/Attributes$Builder;

    move-result-object v2

    .line 1854
    invoke-virtual {v1}, Lio/grpc/internal/ManagedChannelServiceConfig;->getHealthCheckingConfig()Ljava/util/Map;

    move-result-object v3

    if-eqz v3, :cond_10

    .line 1856
    sget-object v4, Lio/grpc/LoadBalancer;->ATTR_HEALTH_CHECKING_CONFIG:Lio/grpc/Attributes$Key;

    .line 1857
    invoke-virtual {v2, v4, v3}, Lio/grpc/Attributes$Builder;->set(Lio/grpc/Attributes$Key;Ljava/lang/Object;)Lio/grpc/Attributes$Builder;

    move-result-object v3

    .line 1858
    invoke-virtual {v3}, Lio/grpc/Attributes$Builder;->build()Lio/grpc/Attributes;

    .line 1860
    :cond_10
    invoke-virtual {v2}, Lio/grpc/Attributes$Builder;->build()Lio/grpc/Attributes;

    move-result-object v2

    iget-object v3, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1862
    iget-object v3, v3, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->helper:Lio/grpc/internal/ManagedChannelImpl$LbHelperImpl;

    iget-object v3, v3, Lio/grpc/internal/ManagedChannelImpl$LbHelperImpl;->lb:Lio/grpc/internal/AutoConfiguredLoadBalancerFactory$AutoConfiguredLoadBalancer;

    .line 1863
    invoke-static {}, Lio/grpc/LoadBalancer$ResolvedAddresses;->newBuilder()Lio/grpc/LoadBalancer$ResolvedAddresses$Builder;

    move-result-object v4

    .line 1864
    invoke-virtual {v4, v0}, Lio/grpc/LoadBalancer$ResolvedAddresses$Builder;->setAddresses(Ljava/util/List;)Lio/grpc/LoadBalancer$ResolvedAddresses$Builder;

    move-result-object v0

    .line 1865
    invoke-virtual {v0, v2}, Lio/grpc/LoadBalancer$ResolvedAddresses$Builder;->setAttributes(Lio/grpc/Attributes;)Lio/grpc/LoadBalancer$ResolvedAddresses$Builder;

    move-result-object v0

    .line 1866
    invoke-virtual {v1}, Lio/grpc/internal/ManagedChannelServiceConfig;->getLoadBalancingConfig()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/grpc/LoadBalancer$ResolvedAddresses$Builder;->setLoadBalancingPolicyConfig(Ljava/lang/Object;)Lio/grpc/LoadBalancer$ResolvedAddresses$Builder;

    move-result-object v0

    .line 1867
    invoke-virtual {v0}, Lio/grpc/LoadBalancer$ResolvedAddresses$Builder;->build()Lio/grpc/LoadBalancer$ResolvedAddresses;

    move-result-object v0

    .line 1862
    invoke-virtual {v3, v0}, Lio/grpc/internal/AutoConfiguredLoadBalancerFactory$AutoConfiguredLoadBalancer;->tryAcceptResolvedAddresses(Lio/grpc/LoadBalancer$ResolvedAddresses;)Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NamesResolved;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    .line 1870
    invoke-static {v0}, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->access$7800(Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;)V

    :cond_11
    return-void
.end method
