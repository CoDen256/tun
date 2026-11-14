.class Lio/grpc/internal/MigratingThreadDeframer$1RequestOp$1;
.super Ljava/lang/Object;
.source "MigratingThreadDeframer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->run(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;

.field final synthetic val$link:Lio/perfmark/Link;


# direct methods
.method constructor <init>(Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;Lio/perfmark/Link;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp$1;->this$1:Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;

    iput-object p2, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp$1;->val$link:Lio/perfmark/Link;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const-string v0, "MigratingThreadDeframer.request"

    .line 148
    invoke-static {v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    iget-object v1, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp$1;->val$link:Lio/perfmark/Link;

    .line 149
    invoke-static {v1}, Lio/perfmark/PerfMark;->linkIn(Lio/perfmark/Link;)V

    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp$1;->this$1:Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;

    .line 154
    iget-object v1, v1, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->this$0:Lio/grpc/internal/MigratingThreadDeframer;

    iget-object v2, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp$1;->this$1:Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;

    iget v2, v2, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->val$numMessages:I

    invoke-static {v1, v2}, Lio/grpc/internal/MigratingThreadDeframer;->access$200(Lio/grpc/internal/MigratingThreadDeframer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    invoke-static {v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception v1

    invoke-static {v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw v1
.end method
