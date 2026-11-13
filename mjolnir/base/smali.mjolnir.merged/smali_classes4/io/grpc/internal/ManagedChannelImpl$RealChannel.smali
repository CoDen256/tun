.class Lio/grpc/internal/ManagedChannelImpl$RealChannel;
.super Lio/grpc/Channel;
.source "ManagedChannelImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/ManagedChannelImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RealChannel"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;
    }
.end annotation


# instance fields
.field private final authority:Ljava/lang/String;

.field private final clientCallImplChannel:Lio/grpc/Channel;

.field private final configSelector:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/grpc/InternalConfigSelector;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/grpc/internal/ManagedChannelImpl;


# direct methods
.method private constructor <init>(Lio/grpc/internal/ManagedChannelImpl;Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 968
    invoke-direct {p0}, Lio/grpc/Channel;-><init>()V

    .line 939
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 940
    invoke-static {}, Lio/grpc/internal/ManagedChannelImpl;->access$3500()Lio/grpc/InternalConfigSelector;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->configSelector:Ljava/util/concurrent/atomic/AtomicReference;

    .line 945
    new-instance p1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$1;

    invoke-direct {p1, p0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$1;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel;)V

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->clientCallImplChannel:Lio/grpc/Channel;

    const-string p1, "authority"

    .line 969
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->authority:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lio/grpc/internal/ManagedChannelImpl;Ljava/lang/String;Lio/grpc/internal/ManagedChannelImpl$1;)V
    .locals 0

    .line 936
    invoke-direct {p0, p1, p2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;-><init>(Lio/grpc/internal/ManagedChannelImpl;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3000(Lio/grpc/internal/ManagedChannelImpl$RealChannel;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 0

    .line 936
    iget-object p0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->configSelector:Ljava/util/concurrent/atomic/AtomicReference;

    return-object p0
.end method

.method static synthetic access$4100(Lio/grpc/internal/ManagedChannelImpl$RealChannel;)Ljava/lang/String;
    .locals 0

    .line 936
    iget-object p0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->authority:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$4500(Lio/grpc/internal/ManagedChannelImpl$RealChannel;Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;
    .locals 0

    .line 936
    invoke-direct {p0, p1, p2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->newClientCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;

    move-result-object p0

    return-object p0
.end method

.method private newClientCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ReqT:",
            "Ljava/lang/Object;",
            "RespT:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/MethodDescriptor<",
            "TReqT;TRespT;>;",
            "Lio/grpc/CallOptions;",
            ")",
            "Lio/grpc/ClientCall<",
            "TReqT;TRespT;>;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->configSelector:Ljava/util/concurrent/atomic/AtomicReference;

    .line 1145
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lio/grpc/InternalConfigSelector;

    if-nez v2, :cond_0

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->clientCallImplChannel:Lio/grpc/Channel;

    .line 1147
    invoke-virtual {v0, p1, p2}, Lio/grpc/Channel;->newCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;

    move-result-object p1

    return-object p1

    .line 1149
    :cond_0
    instance-of v0, v2, Lio/grpc/internal/ManagedChannelServiceConfig$ServiceConfigConvertedSelector;

    if-eqz v0, :cond_2

    .line 1150
    check-cast v2, Lio/grpc/internal/ManagedChannelServiceConfig$ServiceConfigConvertedSelector;

    iget-object v0, v2, Lio/grpc/internal/ManagedChannelServiceConfig$ServiceConfigConvertedSelector;->config:Lio/grpc/internal/ManagedChannelServiceConfig;

    .line 1151
    invoke-virtual {v0, p1}, Lio/grpc/internal/ManagedChannelServiceConfig;->getMethodConfig(Lio/grpc/MethodDescriptor;)Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1153
    sget-object v1, Lio/grpc/internal/ManagedChannelServiceConfig$MethodInfo;->KEY:Lio/grpc/CallOptions$Key;

    invoke-virtual {p2, v1, v0}, Lio/grpc/CallOptions;->withOption(Lio/grpc/CallOptions$Key;Ljava/lang/Object;)Lio/grpc/CallOptions;

    move-result-object p2

    :cond_1
    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->clientCallImplChannel:Lio/grpc/Channel;

    .line 1155
    invoke-virtual {v0, p1, p2}, Lio/grpc/Channel;->newCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;

    move-result-object p1

    return-object p1

    .line 1157
    :cond_2
    new-instance v0, Lio/grpc/internal/ManagedChannelImpl$ConfigSelectingClientCall;

    iget-object v3, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->clientCallImplChannel:Lio/grpc/Channel;

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 1158
    invoke-static {v1}, Lio/grpc/internal/ManagedChannelImpl;->access$4600(Lio/grpc/internal/ManagedChannelImpl;)Ljava/util/concurrent/Executor;

    move-result-object v4

    move-object v1, v0

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lio/grpc/internal/ManagedChannelImpl$ConfigSelectingClientCall;-><init>(Lio/grpc/InternalConfigSelector;Lio/grpc/Channel;Ljava/util/concurrent/Executor;Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)V

    return-object v0
.end method


# virtual methods
.method public authority()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->authority:Ljava/lang/String;

    return-object v0
.end method

.method public newCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ReqT:",
            "Ljava/lang/Object;",
            "RespT:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/MethodDescriptor<",
            "TReqT;TRespT;>;",
            "Lio/grpc/CallOptions;",
            ")",
            "Lio/grpc/ClientCall<",
            "TReqT;TRespT;>;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->configSelector:Ljava/util/concurrent/atomic/AtomicReference;

    .line 975
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lio/grpc/internal/ManagedChannelImpl;->access$3500()Lio/grpc/InternalConfigSelector;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 976
    invoke-direct {p0, p1, p2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->newClientCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 978
    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl;->syncContext:Lio/grpc/SynchronizationContext;

    new-instance v1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$2;

    invoke-direct {v1, p0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$2;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel;)V

    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->configSelector:Ljava/util/concurrent/atomic/AtomicReference;

    .line 984
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lio/grpc/internal/ManagedChannelImpl;->access$3500()Lio/grpc/InternalConfigSelector;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 988
    invoke-direct {p0, p1, p2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->newClientCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;

    move-result-object p1

    return-object p1

    :cond_1
    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 990
    invoke-static {v0}, Lio/grpc/internal/ManagedChannelImpl;->access$1500(Lio/grpc/internal/ManagedChannelImpl;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 992
    new-instance p1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$3;

    invoke-direct {p1, p0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$3;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel;)V

    return-object p1

    .line 1007
    :cond_2
    invoke-static {}, Lio/grpc/Context;->current()Lio/grpc/Context;

    move-result-object v0

    .line 1008
    new-instance v1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;

    invoke-direct {v1, p0, v0, p1, p2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel;Lio/grpc/Context;Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)V

    iget-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 1009
    iget-object p1, p1, Lio/grpc/internal/ManagedChannelImpl;->syncContext:Lio/grpc/SynchronizationContext;

    new-instance p2, Lio/grpc/internal/ManagedChannelImpl$RealChannel$4;

    invoke-direct {p2, p0, v1}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$4;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel;Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;)V

    invoke-virtual {p1, p2}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    return-object v1
.end method

.method onConfigError()V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->configSelector:Ljava/util/concurrent/atomic/AtomicReference;

    .line 1039
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lio/grpc/internal/ManagedChannelImpl;->access$3500()Lio/grpc/InternalConfigSelector;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 1040
    invoke-virtual {p0, v0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->updateConfigSelector(Lio/grpc/InternalConfigSelector;)V

    :cond_0
    return-void
.end method

.method shutdown()V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 1057
    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl;->syncContext:Lio/grpc/SynchronizationContext;

    new-instance v1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$1RealChannelShutdown;

    invoke-direct {v1, p0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$1RealChannelShutdown;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel;)V

    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method shutdownNow()V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 1076
    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl;->syncContext:Lio/grpc/SynchronizationContext;

    new-instance v1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$1RealChannelShutdownNow;

    invoke-direct {v1, p0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$1RealChannelShutdownNow;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel;)V

    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method updateConfigSelector(Lio/grpc/InternalConfigSelector;)V
    .locals 2
    .param p1    # Lio/grpc/InternalConfigSelector;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->configSelector:Ljava/util/concurrent/atomic/AtomicReference;

    .line 1028
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/InternalConfigSelector;

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->configSelector:Ljava/util/concurrent/atomic/AtomicReference;

    .line 1029
    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1030
    invoke-static {}, Lio/grpc/internal/ManagedChannelImpl;->access$3500()Lio/grpc/InternalConfigSelector;

    move-result-object p1

    if-ne v0, p1, :cond_0

    iget-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {p1}, Lio/grpc/internal/ManagedChannelImpl;->access$4200(Lio/grpc/internal/ManagedChannelImpl;)Ljava/util/Collection;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    .line 1031
    invoke-static {p1}, Lio/grpc/internal/ManagedChannelImpl;->access$4200(Lio/grpc/internal/ManagedChannelImpl;)Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;

    .line 1032
    invoke-virtual {v0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->reprocess()V

    goto :goto_0

    :cond_0
    return-void
.end method
