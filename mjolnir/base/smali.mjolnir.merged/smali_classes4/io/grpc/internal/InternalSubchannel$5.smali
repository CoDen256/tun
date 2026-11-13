.class Lio/grpc/internal/InternalSubchannel$5;
.super Ljava/lang/Object;
.source "InternalSubchannel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/InternalSubchannel;->shutdown(Lio/grpc/Status;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/internal/InternalSubchannel;

.field final synthetic val$reason:Lio/grpc/Status;


# direct methods
.method constructor <init>(Lio/grpc/internal/InternalSubchannel;Lio/grpc/Status;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    iput-object p2, p0, Lio/grpc/internal/InternalSubchannel$5;->val$reason:Lio/grpc/Status;

    .line 405
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 410
    invoke-static {v0}, Lio/grpc/internal/InternalSubchannel;->access$100(Lio/grpc/internal/InternalSubchannel;)Lio/grpc/ConnectivityStateInfo;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/ConnectivityStateInfo;->getState()Lio/grpc/ConnectivityState;

    move-result-object v0

    sget-object v1, Lio/grpc/ConnectivityState;->SHUTDOWN:Lio/grpc/ConnectivityState;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    iget-object v1, p0, Lio/grpc/internal/InternalSubchannel$5;->val$reason:Lio/grpc/Status;

    .line 413
    invoke-static {v0, v1}, Lio/grpc/internal/InternalSubchannel;->access$1602(Lio/grpc/internal/InternalSubchannel;Lio/grpc/Status;)Lio/grpc/Status;

    iget-object v0, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 414
    invoke-static {v0}, Lio/grpc/internal/InternalSubchannel;->access$1000(Lio/grpc/internal/InternalSubchannel;)Lio/grpc/internal/ManagedClientTransport;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 415
    invoke-static {v1}, Lio/grpc/internal/InternalSubchannel;->access$1100(Lio/grpc/internal/InternalSubchannel;)Lio/grpc/internal/ConnectionClientTransport;

    move-result-object v1

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    const/4 v3, 0x0

    .line 416
    invoke-static {v2, v3}, Lio/grpc/internal/InternalSubchannel;->access$1002(Lio/grpc/internal/InternalSubchannel;Lio/grpc/internal/ManagedClientTransport;)Lio/grpc/internal/ManagedClientTransport;

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 417
    invoke-static {v2, v3}, Lio/grpc/internal/InternalSubchannel;->access$1102(Lio/grpc/internal/InternalSubchannel;Lio/grpc/internal/ConnectionClientTransport;)Lio/grpc/internal/ConnectionClientTransport;

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 418
    sget-object v4, Lio/grpc/ConnectivityState;->SHUTDOWN:Lio/grpc/ConnectivityState;

    invoke-static {v2, v4}, Lio/grpc/internal/InternalSubchannel;->access$300(Lio/grpc/internal/InternalSubchannel;Lio/grpc/ConnectivityState;)V

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 419
    invoke-static {v2}, Lio/grpc/internal/InternalSubchannel;->access$800(Lio/grpc/internal/InternalSubchannel;)Lio/grpc/internal/InternalSubchannel$Index;

    move-result-object v2

    invoke-virtual {v2}, Lio/grpc/internal/InternalSubchannel$Index;->reset()V

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 420
    invoke-static {v2}, Lio/grpc/internal/InternalSubchannel;->access$1700(Lio/grpc/internal/InternalSubchannel;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 421
    invoke-static {v2}, Lio/grpc/internal/InternalSubchannel;->access$1800(Lio/grpc/internal/InternalSubchannel;)V

    :cond_1
    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 423
    invoke-static {v2}, Lio/grpc/internal/InternalSubchannel;->access$700(Lio/grpc/internal/InternalSubchannel;)V

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 424
    invoke-static {v2}, Lio/grpc/internal/InternalSubchannel;->access$1200(Lio/grpc/internal/InternalSubchannel;)Lio/grpc/SynchronizationContext$ScheduledHandle;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 425
    invoke-static {v2}, Lio/grpc/internal/InternalSubchannel;->access$1200(Lio/grpc/internal/InternalSubchannel;)Lio/grpc/SynchronizationContext$ScheduledHandle;

    move-result-object v2

    invoke-virtual {v2}, Lio/grpc/SynchronizationContext$ScheduledHandle;->cancel()V

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 426
    invoke-static {v2}, Lio/grpc/internal/InternalSubchannel;->access$1300(Lio/grpc/internal/InternalSubchannel;)Lio/grpc/internal/ManagedClientTransport;

    move-result-object v2

    iget-object v4, p0, Lio/grpc/internal/InternalSubchannel$5;->val$reason:Lio/grpc/Status;

    invoke-interface {v2, v4}, Lio/grpc/internal/ManagedClientTransport;->shutdown(Lio/grpc/Status;)V

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 427
    invoke-static {v2, v3}, Lio/grpc/internal/InternalSubchannel;->access$1202(Lio/grpc/internal/InternalSubchannel;Lio/grpc/SynchronizationContext$ScheduledHandle;)Lio/grpc/SynchronizationContext$ScheduledHandle;

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->this$0:Lio/grpc/internal/InternalSubchannel;

    .line 428
    invoke-static {v2, v3}, Lio/grpc/internal/InternalSubchannel;->access$1302(Lio/grpc/internal/InternalSubchannel;Lio/grpc/internal/ManagedClientTransport;)Lio/grpc/internal/ManagedClientTransport;

    :cond_2
    if-eqz v0, :cond_3

    iget-object v2, p0, Lio/grpc/internal/InternalSubchannel$5;->val$reason:Lio/grpc/Status;

    .line 431
    invoke-interface {v0, v2}, Lio/grpc/internal/ManagedClientTransport;->shutdown(Lio/grpc/Status;)V

    :cond_3
    if-eqz v1, :cond_4

    iget-object v0, p0, Lio/grpc/internal/InternalSubchannel$5;->val$reason:Lio/grpc/Status;

    .line 434
    invoke-interface {v1, v0}, Lio/grpc/internal/ConnectionClientTransport;->shutdown(Lio/grpc/Status;)V

    :cond_4
    return-void
.end method
