.class Lio/grpc/inprocess/InProcessTransport$3;
.super Ljava/lang/Object;
.source "InProcessTransport.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/inprocess/InProcessTransport;->start(Lio/grpc/internal/ManagedClientTransport$Listener;)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/inprocess/InProcessTransport;

.field final synthetic val$localShutdownStatus:Lio/grpc/Status;


# direct methods
.method constructor <init>(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/Status;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/inprocess/InProcessTransport$3;->this$0:Lio/grpc/inprocess/InProcessTransport;

    iput-object p2, p0, Lio/grpc/inprocess/InProcessTransport$3;->val$localShutdownStatus:Lio/grpc/Status;

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lio/grpc/inprocess/InProcessTransport$3;->this$0:Lio/grpc/inprocess/InProcessTransport;

    .line 199
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lio/grpc/inprocess/InProcessTransport$3;->this$0:Lio/grpc/inprocess/InProcessTransport;

    iget-object v2, p0, Lio/grpc/inprocess/InProcessTransport$3;->val$localShutdownStatus:Lio/grpc/Status;

    .line 200
    invoke-static {v1, v2}, Lio/grpc/inprocess/InProcessTransport;->access$100(Lio/grpc/inprocess/InProcessTransport;Lio/grpc/Status;)V

    iget-object v1, p0, Lio/grpc/inprocess/InProcessTransport$3;->this$0:Lio/grpc/inprocess/InProcessTransport;

    .line 201
    invoke-static {v1}, Lio/grpc/inprocess/InProcessTransport;->access$200(Lio/grpc/inprocess/InProcessTransport;)V

    .line 202
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
