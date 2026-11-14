.class Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$1;
.super Ljava/lang/Object;
.source "ManagedChannelImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->reprocess()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;

.field final synthetic val$toRun:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$1;->this$2:Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;

    iput-object p2, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$1;->val$toRun:Ljava/lang/Runnable;

    .line 1110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$1;->val$toRun:Ljava/lang/Runnable;

    .line 1113
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$1;->this$2:Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;

    .line 1114
    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->this$1:Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl;->syncContext:Lio/grpc/SynchronizationContext;

    new-instance v1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$PendingCallRemoval;

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$1;->this$2:Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;

    invoke-direct {v1, v2}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$PendingCallRemoval;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;)V

    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
