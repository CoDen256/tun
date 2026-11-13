.class final Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;
.super Lio/grpc/internal/ContextRunnable;
.source "ServerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->streamCreatedInternal(Lio/grpc/internal/ServerStream;Ljava/lang/String;Lio/grpc/Metadata;Lio/perfmark/Tag;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "MethodLookup"
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

.field final synthetic val$context:Lio/grpc/Context$CancellableContext;

.field final synthetic val$future:Lcom/google/common/util/concurrent/SettableFuture;

.field final synthetic val$headers:Lio/grpc/Metadata;

.field final synthetic val$jumpListener:Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;

.field final synthetic val$link:Lio/perfmark/Link;

.field final synthetic val$methodName:Ljava/lang/String;

.field final synthetic val$statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

.field final synthetic val$stream:Lio/grpc/internal/ServerStream;

.field final synthetic val$tag:Lio/perfmark/Tag;

.field final synthetic val$wrappedExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method constructor <init>(Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;Lio/grpc/Context$CancellableContext;Lio/perfmark/Tag;Lio/perfmark/Link;Ljava/lang/String;Lio/grpc/internal/ServerStream;Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;Lcom/google/common/util/concurrent/SettableFuture;Lio/grpc/internal/StatsTraceContext;Lio/grpc/Metadata;Ljava/util/concurrent/Executor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    iput-object p2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$context:Lio/grpc/Context$CancellableContext;

    iput-object p3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$tag:Lio/perfmark/Tag;

    iput-object p4, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$link:Lio/perfmark/Link;

    iput-object p5, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$methodName:Ljava/lang/String;

    iput-object p6, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$stream:Lio/grpc/internal/ServerStream;

    iput-object p7, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$jumpListener:Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;

    iput-object p8, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$future:Lcom/google/common/util/concurrent/SettableFuture;

    iput-object p9, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    iput-object p10, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$headers:Lio/grpc/Metadata;

    iput-object p11, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$wrappedExecutor:Ljava/util/concurrent/Executor;

    .line 521
    invoke-direct {p0, p2}, Lio/grpc/internal/ContextRunnable;-><init>(Lio/grpc/Context;)V

    return-void
.end method

.method private maySwitchExecutor(Lio/grpc/ServerMethodDefinition;Lio/grpc/internal/ServerStream;Lio/grpc/Metadata;Lio/grpc/Context$CancellableContext;Lio/perfmark/Tag;)Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$ServerCallParameters;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ReqT:",
            "Ljava/lang/Object;",
            "RespT:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/ServerMethodDefinition<",
            "TReqT;TRespT;>;",
            "Lio/grpc/internal/ServerStream;",
            "Lio/grpc/Metadata;",
            "Lio/grpc/Context$CancellableContext;",
            "Lio/perfmark/Tag;",
            ")",
            "Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$ServerCallParameters<",
            "TReqT;TRespT;>;"
        }
    .end annotation

    .line 575
    new-instance v9, Lio/grpc/internal/ServerCallImpl;

    .line 577
    invoke-virtual {p1}, Lio/grpc/ServerMethodDefinition;->getMethodDescriptor()Lio/grpc/MethodDescriptor;

    move-result-object v2

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    iget-object v0, v0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->this$0:Lio/grpc/internal/ServerImpl;

    .line 580
    invoke-static {v0}, Lio/grpc/internal/ServerImpl;->access$1500(Lio/grpc/internal/ServerImpl;)Lio/grpc/DecompressorRegistry;

    move-result-object v5

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    iget-object v0, v0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->this$0:Lio/grpc/internal/ServerImpl;

    .line 581
    invoke-static {v0}, Lio/grpc/internal/ServerImpl;->access$2000(Lio/grpc/internal/ServerImpl;)Lio/grpc/CompressorRegistry;

    move-result-object v6

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    iget-object v0, v0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->this$0:Lio/grpc/internal/ServerImpl;

    .line 582
    invoke-static {v0}, Lio/grpc/internal/ServerImpl;->access$2100(Lio/grpc/internal/ServerImpl;)Lio/grpc/internal/CallTracer;

    move-result-object v7

    move-object v0, v9

    move-object v1, p2

    move-object v3, p3

    move-object v4, p4

    move-object v8, p5

    invoke-direct/range {v0 .. v8}, Lio/grpc/internal/ServerCallImpl;-><init>(Lio/grpc/internal/ServerStream;Lio/grpc/MethodDescriptor;Lio/grpc/Metadata;Lio/grpc/Context$CancellableContext;Lio/grpc/DecompressorRegistry;Lio/grpc/CompressorRegistry;Lio/grpc/internal/CallTracer;Lio/perfmark/Tag;)V

    iget-object p2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    .line 584
    iget-object p2, p2, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->this$0:Lio/grpc/internal/ServerImpl;

    invoke-static {p2}, Lio/grpc/internal/ServerImpl;->access$1300(Lio/grpc/internal/ServerImpl;)Lio/grpc/ServerCallExecutorSupplier;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    .line 585
    iget-object p2, p2, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->this$0:Lio/grpc/internal/ServerImpl;

    invoke-static {p2}, Lio/grpc/internal/ServerImpl;->access$1300(Lio/grpc/internal/ServerImpl;)Lio/grpc/ServerCallExecutorSupplier;

    move-result-object p2

    invoke-interface {p2, v9, p3}, Lio/grpc/ServerCallExecutorSupplier;->getExecutor(Lio/grpc/ServerCall;Lio/grpc/Metadata;)Ljava/util/concurrent/Executor;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$wrappedExecutor:Ljava/util/concurrent/Executor;

    .line 587
    check-cast p3, Lio/grpc/internal/SerializingExecutor;

    invoke-virtual {p3, p2}, Lio/grpc/internal/SerializingExecutor;->setExecutor(Ljava/util/concurrent/Executor;)V

    .line 590
    :cond_0
    new-instance p2, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$ServerCallParameters;

    iget-object p3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    invoke-virtual {p1}, Lio/grpc/ServerMethodDefinition;->getServerCallHandler()Lio/grpc/ServerCallHandler;

    move-result-object p1

    invoke-direct {p2, p3, v9, p1}, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$ServerCallParameters;-><init>(Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;Lio/grpc/internal/ServerCallImpl;Lio/grpc/ServerCallHandler;)V

    return-object p2
.end method

.method private runInternal()V
    .locals 12

    const-string v0, "Method not found: "

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    .line 539
    iget-object v3, v3, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->this$0:Lio/grpc/internal/ServerImpl;

    invoke-static {v3}, Lio/grpc/internal/ServerImpl;->access$1700(Lio/grpc/internal/ServerImpl;)Lio/grpc/HandlerRegistry;

    move-result-object v3

    iget-object v4, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$methodName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lio/grpc/HandlerRegistry;->lookupMethod(Ljava/lang/String;)Lio/grpc/ServerMethodDefinition;

    move-result-object v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    .line 541
    iget-object v3, v3, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->this$0:Lio/grpc/internal/ServerImpl;

    invoke-static {v3}, Lio/grpc/internal/ServerImpl;->access$1800(Lio/grpc/internal/ServerImpl;)Lio/grpc/HandlerRegistry;

    move-result-object v3

    iget-object v4, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$methodName:Ljava/lang/String;

    iget-object v5, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$stream:Lio/grpc/internal/ServerStream;

    invoke-interface {v5}, Lio/grpc/internal/ServerStream;->getAuthority()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lio/grpc/HandlerRegistry;->lookupMethod(Ljava/lang/String;Ljava/lang/String;)Lio/grpc/ServerMethodDefinition;

    move-result-object v3

    :cond_0
    if-nez v3, :cond_1

    .line 544
    sget-object v3, Lio/grpc/Status;->UNIMPLEMENTED:Lio/grpc/Status;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$methodName:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$jumpListener:Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;

    .line 551
    invoke-static {}, Lio/grpc/internal/ServerImpl;->access$1600()Lio/grpc/internal/ServerStreamListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->setListener(Lio/grpc/internal/ServerStreamListener;)V

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$stream:Lio/grpc/internal/ServerStream;

    .line 552
    new-instance v4, Lio/grpc/Metadata;

    invoke-direct {v4}, Lio/grpc/Metadata;-><init>()V

    invoke-interface {v3, v0, v4}, Lio/grpc/internal/ServerStream;->close(Lio/grpc/Status;Lio/grpc/Metadata;)V

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$context:Lio/grpc/Context$CancellableContext;

    .line 553
    invoke-virtual {v0, v2}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$future:Lcom/google/common/util/concurrent/SettableFuture;

    .line 554
    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/SettableFuture;->cancel(Z)Z

    return-void

    :cond_1
    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->this$1:Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;

    iget-object v4, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$stream:Lio/grpc/internal/ServerStream;

    iget-object v5, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    .line 557
    invoke-static {v0, v4, v3, v5}, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;->access$1900(Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl;Lio/grpc/internal/ServerStream;Lio/grpc/ServerMethodDefinition;Lio/grpc/internal/StatsTraceContext;)Lio/grpc/ServerMethodDefinition;

    move-result-object v7

    iget-object v8, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$stream:Lio/grpc/internal/ServerStream;

    iget-object v9, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$headers:Lio/grpc/Metadata;

    iget-object v10, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$context:Lio/grpc/Context$CancellableContext;

    iget-object v11, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$tag:Lio/perfmark/Tag;

    move-object v6, p0

    .line 558
    invoke-direct/range {v6 .. v11}, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->maySwitchExecutor(Lio/grpc/ServerMethodDefinition;Lio/grpc/internal/ServerStream;Lio/grpc/Metadata;Lio/grpc/Context$CancellableContext;Lio/perfmark/Tag;)Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$ServerCallParameters;

    move-result-object v0

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$future:Lcom/google/common/util/concurrent/SettableFuture;

    .line 559
    invoke-virtual {v3, v0}, Lcom/google/common/util/concurrent/SettableFuture;->set(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$jumpListener:Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;

    .line 561
    invoke-static {}, Lio/grpc/internal/ServerImpl;->access$1600()Lio/grpc/internal/ServerStreamListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/grpc/internal/ServerImpl$JumpToApplicationThreadServerStreamListener;->setListener(Lio/grpc/internal/ServerStreamListener;)V

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$stream:Lio/grpc/internal/ServerStream;

    .line 562
    invoke-static {v0}, Lio/grpc/Status;->fromThrowable(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object v4

    new-instance v5, Lio/grpc/Metadata;

    invoke-direct {v5}, Lio/grpc/Metadata;-><init>()V

    invoke-interface {v3, v4, v5}, Lio/grpc/internal/ServerStream;->close(Lio/grpc/Status;Lio/grpc/Metadata;)V

    iget-object v3, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$context:Lio/grpc/Context$CancellableContext;

    .line 563
    invoke-virtual {v3, v2}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    iget-object v2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$future:Lcom/google/common/util/concurrent/SettableFuture;

    .line 564
    invoke-virtual {v2, v1}, Lcom/google/common/util/concurrent/SettableFuture;->cancel(Z)Z

    .line 565
    throw v0
.end method


# virtual methods
.method public runInContext()V
    .locals 3

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$tag:Lio/perfmark/Tag;

    const-string v1, "ServerTransportListener$MethodLookup.startCall"

    .line 526
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$link:Lio/perfmark/Link;

    .line 527
    invoke-static {v0}, Lio/perfmark/PerfMark;->linkIn(Lio/perfmark/Link;)V

    .line 529
    :try_start_0
    invoke-direct {p0}, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->runInternal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$tag:Lio/perfmark/Tag;

    .line 531
    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object v2, p0, Lio/grpc/internal/ServerImpl$ServerTransportListenerImpl$1MethodLookup;->val$tag:Lio/perfmark/Tag;

    invoke-static {v1, v2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    throw v0
.end method
